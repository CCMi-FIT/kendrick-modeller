api
removed: aModel
	dirty := true.
	self removeDependenciesOf: aModel.
	transformedModels removeKey: aModel.
	externalModels removeKey: aModel.
	originalModels remove: aModel.
	dirty := false