private
modelsWithInvalidModulesExcept: aDefinitionModel
	"returns a collection of definition models that have module links linking to models that are not amongst resulting models"

	| flatTransformedModels models |
	flatTransformedModels := resultingModels flatCollectAsSet: [ :each | each ].
	models := project models
		select: [ :eachDefinitionModel | 
			eachDefinitionModel ~~ aDefinitionModel
				and: [ eachDefinitionModel moduleLinks
						anySatisfy:
							[ :eachModule | flatTransformedModels noneSatisfy: [ :any | any name = eachModule name ] ] ] ].
	^ models