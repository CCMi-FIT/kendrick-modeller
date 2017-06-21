accessing
modelsWithInvalidModulesExcept: anOpenPonkDiagram
	| flatTransformedModels models |
	flatTransformedModels := transformedModels flatCollectAsSet: [ :each | each ].
	models := project models
		select:
			[ :eachDefinitionModel | (eachDefinitionModel ~~ anOpenPonkDiagram) and: [eachDefinitionModel modules anySatisfy: [ :eachModule | flatTransformedModels noneSatisfy: [ :any | any name = eachModule name ] ] ]].
	^ models