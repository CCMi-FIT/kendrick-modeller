api
project: anOpenPonkProject
	dirty := true.
	project := anOpenPonkProject.
	project models do: [ :each | self addedWithoutFlags: each ].
	dirty := false