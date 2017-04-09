hooks
selectPossibleModules: aDiagramsCollection
	model modules ifNotEmpty: [ ^ OrderedCollection new ].
	^ (aDiagramsCollection reject: [ :eachModel | eachModel == model ]) asOrderedCollection