hooks
selectPossibleModules
	model modules ifNotEmpty: [ ^ OrderedCollection new ].
	^ super selectPossibleModules