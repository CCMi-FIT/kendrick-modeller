private
getResultModelsFrom: aKendrickModel madeFrom: anOpenPonkDiagram
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