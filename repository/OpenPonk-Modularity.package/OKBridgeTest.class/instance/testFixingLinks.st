tests
testFixingLinks
	"note that this test wouldn't work if testProjectWithBrokenLinks does not work"

	| project definitionModels |
	project := OKDummyProject new.
	definitionModels := (project definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	(definitionModels at: 'Y') moduleLinks first dummyLinkedModel: (OKNamedBrokenReference named: 'G').
	bridge project: project.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 0.
	(definitionModels at: 'Y') moduleLinks first dummyLinkedModel: (OKNamedBrokenReference named: 'X-e2-r2').
	bridge renamedLinkIn: (definitionModels at: 'Y').
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4