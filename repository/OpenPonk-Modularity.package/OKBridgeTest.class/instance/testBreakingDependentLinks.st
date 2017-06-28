tests
testBreakingDependentLinks
	"note that this test wouldn't work if testBreakingElementLinks does not work"

	| definitionModels |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ])
		as: Dictionary.
	(definitionModels at: 'Y') dependsOnElementNamed: 'X-e2-r2-element'.
	bridge
		added: (definitionModels at: 'Y') elementAndEdgeLinks first
		in: (definitionModels at: 'Y').
	self assert: (definitionModels at: 'Y') moduleLinks first isValid.
	self assert: (definitionModels at: 'Y') elementAndEdgeLinks first isValid.
	(definitionModels at: 'Y') dependsOnModelNamed: 'Invalid one'.
	bridge renamedLinkIn: (definitionModels at: 'Y').
	self deny: (definitionModels at: 'Y') moduleLinks first isValid.
	self deny: (definitionModels at: 'Y') elementAndEdgeLinks first isValid