private
transform: anOpenPonkDiagram
	"create external models from anOpenPonkDiagram, then create resulting models from those external models and finally, update all relevant links to these models (or invalidate those linking to resulting model that has no new replacement)"

	| newTransformedModels |
	externalModels at: anOpenPonkDiagram put: (self getExternalModelsFrom: anOpenPonkDiagram).
	newTransformedModels := (externalModels at: anOpenPonkDiagram)
		flatCollect: [ :each | self getResultModelsFrom: each madeFrom: anOpenPonkDiagram ].
	resultingModels at: anOpenPonkDiagram put: newTransformedModels.
	(newTransformedModels flatCollectAsSet: [ :each | self dependingModelsOn: each ])
		, (self modelsWithInvalidModulesExcept: anOpenPonkDiagram)
		do: [ :eachDependingModel | self updateLinksIn: eachDependingModel ]