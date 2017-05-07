hooks
selectPossibleBackendModules
	model backendModule ifNotNil: [ ^ OrderedCollection new ].
	^ (self project models reject: [ :eachModel | eachModel == model ]) asOrderedCollection