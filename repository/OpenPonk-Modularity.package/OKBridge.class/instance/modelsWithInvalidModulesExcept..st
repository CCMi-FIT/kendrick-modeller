private
modelsWithInvalidModulesExcept: anOpenPonkDiagram
	| flatTransformedModels models |
	flatTransformedModels := resultingModels flatCollectAsSet: [ :each | each ].
	models := project models
		select:
			[ :eachDefinitionModel | (eachDefinitionModel ~~ anOpenPonkDiagram) and: [eachDefinitionModel modules anySatisfy: [ :eachModule | flatTransformedModels noneSatisfy: [ :any | any name = eachModule name ] ] ]].
	^ models