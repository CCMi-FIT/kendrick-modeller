tests
testBreakingLinks
	"note that this test wouldn't work if testUpdatingModuleLinks does not work"

	| definitionModels |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	(definitionModels at: 'Y') moduleLinks first dummyLinkedModel: (OKNamedBrokenReference named: 'G').
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	bridge renamedLinkIn: (definitionModels at: 'Y').
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 0