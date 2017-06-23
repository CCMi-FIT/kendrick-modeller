api
project: anOpenPonkProject
	project := anOpenPonkProject.
	project models do: [ :each | self addedWithoutFlags: each ]