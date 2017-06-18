private
getExternalModelsFrom: aDiagram
	| model elements class modules |
	class := aDiagram kendrickClass.
	modules := aDiagram modules.
	(aDiagram links allSatisfy: [ :any | any isValid ])
		ifFalse: [ ^ {} ].
	model := (aDiagram isConcern and: [ modules size = 1 ])
		ifTrue: [ | m |
			m := class extends: modules anyOne externalKendrickModel.
			m transitions: m transitions copy ]
		ifFalse: [ class new ].
	aDiagram isConcern
		ifFalse: [ modules do: [ :each | model integrate: each externalKendrickModel ] ].
	aDiagram populationSize ifNotNil: [ :populationSize | model population: (KEPopulation size: populationSize) ].
	elements := aDiagram elements select: [ :each | each isLink not and: [ each canBeLinkedTo ] ].
	elements
		select: [ :each | each isState and: [ each hasEditableName ] ]
		thenDo: [ :each | 
			(model atAttribute: each kendrickAttributeType) ifNil: [ model addAttribute: each kendrickAttributeType value: OrderedCollection new ].
			model atAttribute: each kendrickAttributeType add: each name asSymbol ].
	elements
		select: [ :each | each isTransition and: [ each probability isNotEmpty ] ]
		thenDo: [ :each | 
			model
				addTransitionFrom: each source asCompartmentDictionary
				to: each target asCompartmentDictionary
				probability:
					((NumberParser isNumber: each probability)
						ifTrue: [ each probability asNumber ]
						ifFalse: [ [ :m | m atParameter: each probability ] ]) ].
	aDiagram parameters keysAndValuesDo: [ :key :val | model addParameter: key asSymbol value: val ].
	[ aDiagram additionalCodeBlock value: model ]
		on: Error
		do: [ :e | 
			e debug.
			^ {} ].
	^ {model}