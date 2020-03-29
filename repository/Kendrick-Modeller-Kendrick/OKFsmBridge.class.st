"
I am a specific bridge for Kendrick representation made by extending FSM.
"
Class {
	#name : #OKFsmBridge,
	#superclass : #OKBridge,
	#category : #'Kendrick-Modeller-Kendrick-Bridge'
}

{ #category : #private }
OKFsmBridge >> getExternalModelsFrom: aDiagram [
	"This intimidating method is there for creating Kendrick model or concern (KEModel or KEModelPart) from aDiagram (a definition model)."

	| class modules model newElements elementLinks edgeLinks |
	class := aDiagram kendrickClass.
	modules := aDiagram moduleLinks.
	elementLinks := aDiagram elementLinksWithoutEdges.
	edgeLinks := aDiagram edgeLinks.
	
	"do not produce anything if there are invalid links"
	(aDiagram links allSatisfy: [ :any | any isValid ])
		ifFalse: [ ^ {} ].	
	
	"create Kendrick model or concern and intergate all modules"
	model := (aDiagram isConcern and: [ modules size = 1 ])
		ifTrue: [ | m |
			m := class extends: modules anyOne externalKendrickModel.
			"by extending KEModelPart, transitions are copied by shallow copy. this makes a deep(er) one."
			m transitions: (m transitions collect: [ :each | KETransition from: each from to: each to probability: each probability ]) ]
		ifFalse: [ class new ].
	aDiagram isConcern
		ifFalse: [ modules do: [ :each | model integrate: each externalKendrickModel ].
			"set amount of population"
			model population: (KEPopulation size: aDiagram populationSize) ].
	
	"add all states, species and other attributes that are not links"
	newElements := aDiagram elements select: [ :each | each isLink not and: [ each canBeLinkedTo ] ].
	newElements
		select: [ :each | each isState and: [ each hasEditableName ] ]
		thenDo: [ :each | 
			(model atAttribute: each kendrickAttributeType) ifNil: [ model addAttribute: each kendrickAttributeType value: OrderedCollection new ].
			model atAttribute: each kendrickAttributeType add: each name asSymbol ].
			
	"add all transitions that are not links"
	newElements
		select: [ :each | each isTransition and: [ each probability isNotEmpty ] ]
		thenDo: [ :each | 
			model
				addTransitionFrom: each source asCompartmentDictionary
				to: each target asCompartmentDictionary
				probability:
					((NumberParser isNumber: each probability)
						ifTrue: [ each probability asNumber ]
						ifFalse: [ [ :m | m atParameter: each probability ] ]) ].		
			
	"delay transitions -- implementation based on KendrickModel>>#delay:"
	edgeLinks
		select: [ :each | each isDelayDefined ]
		thenDo: [ :each | 
			| sourceAsDictionary targetAsDictionary newDictionary |
			sourceAsDictionary := each source asCompartmentDictionary.
			targetAsDictionary := each target asCompartmentDictionary.
			newDictionary := {(each target kendrickAttributeType -> each delayStateName)} asDictionary.
			model atAttribute: each target kendrickAttributeType add: each delayStateName asSymbol.
			(model transitions detect: [ :any | any from = sourceAsDictionary and: [ any to = targetAsDictionary ] ]) probability: 0.
			model
				addTransitionFrom: sourceAsDictionary
				to: newDictionary
				probability:
					((NumberParser isNumber: each probability)
						ifTrue: [ each probability asNumber ]
						ifFalse: [ [ :m | m atParameter: each probability ] ]).
			model
				addTransitionFrom: newDictionary
				to: targetAsDictionary
				probability:
					((NumberParser isNumber: each delayProbability)
						ifTrue: [ each delayProbability asNumber ]
						ifFalse: [ [ :m | m atParameter: each delayProbability ] ]).
			model addTransitionFrom: newDictionary to: #empty probability: [ :aModel | aModel atParameter: #mu ] ].
		
	"split states"
	elementLinks
		select: [ :each | each isSplitDefined ]
		thenDo: [ :each | 
			model
				splitStatus:
					{(OrderedCollection with: each name).
					(#index -> each splitIndexes)} ].
		
	"add parameters"
	aDiagram parameters keysAndValuesDo: [ :key :val | model addParameter: key asSymbol value: val ].
	
	"execute additionalCodeBlock on model"
	[ aDiagram additionalCodeBlock value: model ]
		on: Error
		do: [ :e |
			"if there is a problem with the code, open a debug window, but allow proceeding while not creating the resulting model"
			"this is a place to log or show to the user problems with creating simulation (wrong parameters etc.)"
			e debug.
			^ {} ].
	^ {model}
]

{ #category : #private }
OKFsmBridge >> getResultModelsFrom: aKendrickModel madeFrom: anOpenPonkDiagram [
	"This intimidating method is there for creating resulting diagram-friendly models and simulation views out of Kendrick model or concern (KEModel or KEModelPart)."

	| model attributes simulator kendrickBuilder data view roassalBuilder |
	"first create a diagram-model of proper type"
	model := OKFsm named: anOpenPonkDiagram name basedOn: aKendrickModel.

	"create all states/species/compartments/..."
	attributes := Dictionary new.
	aKendrickModel attributes
		keysAndValuesDo: [ :key :col | attributes at: key put: col copy ].
	attributes ifEmpty: [ ^ {model} ].
	(attributes includesKey: #status)
		ifTrue: [ (attributes at: #status) add: #empty ].
	attributes size = 1
		ifTrue: [ "it is just a state, just a specie or similar ... no joined compartment of both"
			attributes
				keysAndValuesDo: [ :eachType :eachNames | 
					model
						addAll: (eachNames collect: [ :eachName | OKFsmState named: eachName basedOn: eachType ]) ] ]
		ifFalse: [ | combinations |
			"it is not just a state or just a specie or similar ... it is joined compartment of both or multiple ones"
			combinations := OrderedCollection with: Dictionary new.
			attributes
				keysAndValuesDo: [ :eachType :eachNames | 
					combinations copy
						do: [ :eachCombination | 
							eachNames
								do: [ :eachName | 
									combinations
										add:
											(eachCombination copy
												at: eachType put: eachName;
												yourself) ].
							combinations remove: eachCombination ] ].
			model
				addAll:
					(combinations
						collect: [ :eachDictionary | 
							| compartment |
							compartment := OKFsmCompartment new.
							eachDictionary
								keysAndValuesDo:
									[ :eachAttributeType :eachName | compartment addPart: (OKFsmState named: eachName basedOn: eachAttributeType) ].
							compartment ]) ].

	"add transitions"
	model
		addAll:
			(aKendrickModel transitions
				reject: [ :eachKETransition | eachKETransition probability asString = '0' ]
				thenCollect: [ :eachKETransition | 
					| probability |
					probability := (eachKETransition probability isBlock
						ifTrue: [ eachKETransition probability value: OKFsmDummyKEModel ]
						ifFalse: [ eachKETransition probability ]) asString.
					eachKETransition from size = 1
						ifTrue: [ OKFsmTransition
								from:
									(model elements
										detect: [ :any | any name asSymbol = (eachKETransition from at: any kendrickAttributeType) ])
								to:
									(model elements
										detect: [ :any | any name asSymbol = (eachKETransition to at: any kendrickAttributeType) ])
								probabilityParameter: probability ]
						ifFalse: [ OKFsmTransition
								from:
									(model elements
										detect: [ :anyElement | 
											anyElement parts
												allSatisfy:
													[ :eachPart | eachPart name asSymbol = (eachKETransition from at: eachPart kendrickAttributeType) ] ])
								to:
									(model elements
										detect: [ :anyElement | 
											anyElement parts
												allSatisfy:
													[ :eachPart | eachPart name asSymbol = (eachKETransition to at: eachPart kendrickAttributeType) ] ])
								probabilityParameter: probability ] ]).

	"create simulation if it is defined"
	anOpenPonkDiagram isSimulationDefined
		ifFalse: [ ^ {model} ].
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: anOpenPonkDiagram simulationDuration
		by: anOpenPonkDiagram simulationStepSize.
	view := RTView new.
	[ simulator executeOn: aKendrickModel copy.
	kendrickBuilder := KEDiagramBuilder new.
	data := anOpenPonkDiagram simulateStates
		flatCollect: [ :each | simulator allTimesSeriesContaining: '{#status: #' , each , '}' ].
	kendrickBuilder data: data.
	kendrickBuilder xLabel: 'Time'.
	roassalBuilder := kendrickBuilder build.
	roassalBuilder renderIn: view.
	view addFromView: roassalBuilder view ]
		on: Error
		do: [ :e | 
			e debug.	"this is a place to log or show to the user problems with creating or executing a simulation (wrong parameters etc.)"
			^ {model} ].
	model addView: view.
	^ {model}
]
