private
addDependenciesOf: aDefinitionModel
	"aDefinitionModel is added to values in dependingModels (so that it inditaces that something depends on aDefinitionModel)"

	aDefinitionModel moduleLinks do: [ :each | (self dependingModelsOn: each) add: aDefinitionModel ]