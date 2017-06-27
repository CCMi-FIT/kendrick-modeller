api
removed: aModel
	"call this if aModel has just been removed from the project and bridge does not know about it yet"

	self removeDependenciesOf: aModel.
	resultingModels removeKey: aModel.
	externalModels removeKey: aModel.
	definitionModels remove: aModel