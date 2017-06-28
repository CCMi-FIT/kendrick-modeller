api
added: anElement in: aDefinitionModel
	"call this if anElement has been added to aDefinitionModel, which is a definition model"

	self
		addDependenciesOf: aDefinitionModel;
		process: aDefinitionModel whenChanged: anElement