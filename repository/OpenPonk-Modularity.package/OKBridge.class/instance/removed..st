api
removed: aDefinitionModel
	"call this if aDefinitionModel has just been removed from the project and bridge does not know about it yet"

	self removeDependenciesOf: aDefinitionModel.
	resultingModels removeKey: aDefinitionModel.
	externalModels removeKey: aDefinitionModel.
	definitionModels remove: aDefinitionModel