private
getExternalModelsFrom: anOpenPonkDiagram
	| class model elements statusArray transitions |
	class := anOpenPonkDiagram kendrickClass.
	model := (MessageSend receiver: class selector: anOpenPonkDiagram name asSymbol) value.
	anOpenPonkDiagram backendModule
		ifNotNil: [ :module | 
			anOpenPonkDiagram isComposition
				ifTrue: [ model model: module name.
					anOpenPonkDiagram modules do: [ :each | model concern: each name ] without: module ]
				ifFalse: [ model extends: module name ] ].
	elements := anOpenPonkDiagram elements.
	statusArray := OrderedCollection with: #status with: #->.
	model attribute: statusArray , (elements select: [ :each | each isState ] thenCollect: [ :each | each name asSymbol ]).
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