private
getExternalModelsFrom: anOpenPonkDiagram
	| class model elements transitions states |
	class := anOpenPonkDiagram kendrickClass.
	model := (MessageSend receiver: class selector: anOpenPonkDiagram name asSymbol) value.
	anOpenPonkDiagram isConcern
		ifTrue: [ | extended |
			extended := anOpenPonkDiagram extendedModule ifNil: [ anOpenPonkDiagram ].
			model model: extended name.
			anOpenPonkDiagram modules do: [ :each | model concern: each name ] without: extended ]
		ifFalse: [ anOpenPonkDiagram extendedModule ifNotNil: [ :module | model extends: module name ] ].
	elements := anOpenPonkDiagram elements.
	states := {(#status -> OrderedCollection new).
	(#species -> OrderedCollection new).
	(#patch -> OrderedCollection new)}.
	elements
		select: [ :each | each isState ]
		thenDo: [ :each | (states at: each graphmlType) add: each name asSymbol ].
	states
		keysAndValuesDo: [ :eachKey :eachStates | 
			eachStates
				ifNotEmpty: [ model
						attribute:
							{eachKey.
							#->} , eachStates ] ].
	transitions := elements select: [ :each | each isTransition ].
	model parameters: (transitions collect: [ :each | each probability asSymbol ]).
	model
		transitions:
			(transitions
				flatCollect: [ :each | 
					{each source name asSymbol.
					#--.
					each probability asSymbol.
					#-->.
					(each target name , '.') asSymbol} ]).
	^ {model}