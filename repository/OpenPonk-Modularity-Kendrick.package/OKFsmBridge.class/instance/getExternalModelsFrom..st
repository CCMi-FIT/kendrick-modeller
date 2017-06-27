private
getExternalModelsFrom: aDiagram
	"This intimidating method is there for creating Kendrick model or concern (KEModel or KEModelPart) from aDiagram (a definition model)."

	| class modules model newElements elementLinks edgeLinks |
	class := aDiagram kendrickClass.
	modules := aDiagram modules.
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