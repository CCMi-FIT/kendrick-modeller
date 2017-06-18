private
transform: anOpenPonkDiagram
	| newTransformedModels |
	externalModels at: anOpenPonkDiagram put: (self getExternalModelsFrom: anOpenPonkDiagram).
	newTransformedModels := (externalModels at: anOpenPonkDiagram)
		flatCollect: [ :each | self getTransformedModelsFrom: each madeFrom: anOpenPonkDiagram ].
	transformedModels at: anOpenPonkDiagram put: newTransformedModels.
	updatedModels add: anOpenPonkDiagram.
	(newTransformedModels flatCollectAsSet: [ :each | self dependingModelsOn: each ])
		, (self modelsWithInvalidModulesExcept: anOpenPonkDiagram) do: [ :eachDependingModel | self updateLinksIn: eachDependingModel ]