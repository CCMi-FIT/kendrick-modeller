tests
testResultingModelsCreation
	"note that this test wouldn't work if testUpdatingModuleLinks does not work"

	| project definitionModels |
	project := OKDummyProject new.
	definitionModels := (project definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	(definitionModels at: 'Y') moduleLinks first dummyLinkedModel: (OKNamedBrokenReference named: 'G').
	bridge project: project.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 0.