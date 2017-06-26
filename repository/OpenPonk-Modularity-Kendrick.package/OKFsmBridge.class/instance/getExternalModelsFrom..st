private
getExternalModelsFrom: aDiagram
	| class modules model newElements elementLinks edgeLinks |
	class := aDiagram kendrickClass.
	modules := aDiagram modules.
	elementLinks := aDiagram elementLinksWithoutEdges.
	edgeLinks := aDiagram edgeLinks.
	(aDiagram links allSatisfy: [ :any | any isValid ])
		ifFalse: [ ^ {} ].
	model := (aDiagram isConcern and: [ modules size = 1 ])
		ifTrue: [ | m |
			m := class extends: modules anyOne externalKendrickModel.
			m transitions: (m transitions collect: [ :each | KETransition from: each from to: each to probability: each probability ]) ]
		ifFalse: [ class new ].
	aDiagram isConcern
		ifFalse: [ modules do: [ :each | model integrate: each externalKendrickModel ].
			model population: (KEPopulation size: aDiagram populationSize) ].
	newElements := aDiagram elements select: [ :each | each isLink not and: [ each canBeLinkedTo ] ].
	newElements
		select: [ :each | each isState and: [ each hasEditableName ] ]
		thenDo: [ :each | 
			(model atAttribute: each kendrickAttributeType) ifNil: [ model addAttribute: each kendrickAttributeType value: OrderedCollection new ].
			model atAttribute: each kendrickAttributeType add: each name asSymbol ].
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
	elementLinks
		select: [ :each | each isSplitDefined ]
		thenDo: [ :each | 
			model
				splitStatus:
					{(OrderedCollection with: each name).
					(#index -> each splitIndexes)} ].
	aDiagram parameters keysAndValuesDo: [ :key :val | model addParameter: key asSymbol value: val ].
	aDiagram isSimulationDefined
		ifFalse: [ ^ {model} ].
	[ aDiagram additionalCodeBlock value: model ]
		on: Error
		do: [ :e | 
			e debug.
			^ {} ].
	^ {model}