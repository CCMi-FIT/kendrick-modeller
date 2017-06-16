private
getExternalModelsFrom: aDiagram
	| model elements states class modules |
	class := aDiagram kendrickClass.
	modules := aDiagram modules.
	model := (aDiagram isConcern and: [ modules size = 1 ])
		ifTrue: [ class extends: modules anyOne externalKendrickModel ]
		ifFalse: [ class new ].
	aDiagram isConcern
		ifFalse: [ modules do: [ :each | model integrate: each externalKendrickModel ] ].
	elements := aDiagram elements.
	states := {(#status -> OrderedCollection new).
	(#species -> OrderedCollection new)} asDictionary.
	elements
		select: [ :each | each isState and: [ each hasEditableName ] ]
		thenDo: [ :each | (states at: each kendrickAttributeType) add: each name asSymbol ].
	states keysAndValuesDo: [ :eachKey :eachStates | eachStates ifNotEmpty: [ model addAttribute: eachKey value: eachStates ] ].
	elements
		select: [ :each | each isTransition ]
		thenDo: [ :each | 
			model
				addTransitionFrom: each source asCompartmentDictionary
				to: each target asCompartmentDictionary
				probability: [ :m | m atParameter: each probabilityParameter ] ].
	^ {model}