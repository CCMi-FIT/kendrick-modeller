private
modelsWithInvalidModulesExcept: anOpenPonkDiagram
	"returns a collection of definition models that have module links linking to models that are not amongst resulting models"

	| flatTransformedModels models |
	flatTransformedModels := resultingModels flatCollectAsSet: [ :each | each ].
	models := project models
		select: [ :eachDefinitionModel | 
			eachDefinitionModel ~~ anOpenPonkDiagram
				and: [ eachDefinitionModel modules
						anySatisfy: [ :eachModule | flatTransformedModels noneSatisfy: [ :any | any name = eachModule name ] ] ] ].
	^ models