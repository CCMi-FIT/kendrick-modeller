api
removed: aModel
	self removeDependenciesOf: aModel.
	resultingModels removeKey: aModel.
	externalModels removeKey: aModel.
	definitionModels remove: aModel