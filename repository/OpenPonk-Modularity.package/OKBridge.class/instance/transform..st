private
transform: anOpenPonkDiagram
	| newTransformedModels |
	externalModels
		at: anOpenPonkDiagram
		put: (self getExternalModelsFrom: anOpenPonkDiagram).
	newTransformedModels := (externalModels at: anOpenPonkDiagram)
		flatCollect: [ :each | self getResultModelsFrom: each madeFrom: anOpenPonkDiagram ].
	transformedModels at: anOpenPonkDiagram put: newTransformedModels.
	(newTransformedModels
		flatCollectAsSet: [ :each | self dependingModelsOn: each ])
		, (self modelsWithInvalidModulesExcept: anOpenPonkDiagram)
		do: [ :eachDependingModel | self updateLinksIn: eachDependingModel ]