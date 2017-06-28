private
transform: aDefinitionModel
	"create external models from aDefinitionModel, then create resulting models from those external models and finally, update all relevant links to these models (or invalidate those linking to resulting model that has no new replacement)"

	| newTransformedModels |
	externalModels at: aDefinitionModel put: (self getExternalModelsFrom: aDefinitionModel).
	newTransformedModels := (externalModels at: aDefinitionModel)
		flatCollect: [ :each | self getResultModelsFrom: each madeFrom: aDefinitionModel ].
	resultingModels at: aDefinitionModel put: newTransformedModels.
	(newTransformedModels flatCollectAsSet: [ :each | self dependingModelsOn: each ])
		, (self modelsWithInvalidModulesExcept: aDefinitionModel)
		do: [ :eachDependingModel | self updateLinksIn: eachDependingModel ]