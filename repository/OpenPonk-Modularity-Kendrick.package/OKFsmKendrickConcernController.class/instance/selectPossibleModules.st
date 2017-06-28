hooks
selectPossibleModules
	model moduleLinks ifNotEmpty: [ ^ OrderedCollection new ].
	^ super selectPossibleModules