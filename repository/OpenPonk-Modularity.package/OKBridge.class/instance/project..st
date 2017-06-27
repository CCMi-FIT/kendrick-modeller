api
project: anOpenPonkProject
	"called when created for a project"

	project := anOpenPonkProject.
	project models do: [ :each | self addedWithoutFlags: each ]