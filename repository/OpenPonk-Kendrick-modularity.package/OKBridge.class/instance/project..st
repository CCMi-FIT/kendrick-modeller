api
project: anOpenPonkProject
	dirty := true.
	project := anOpenPonkProject.
	project models
		do: [ :each | 
			originalModels add: each.
			self addDependenciesOf: each ].
	dirty := false