hooks
selectPossibleModules
	model extendedModule ifNotNil: [ ^ OrderedCollection new ].
	^ (self project models reject: [ :eachModel | eachModel == model ]) asOrderedCollection