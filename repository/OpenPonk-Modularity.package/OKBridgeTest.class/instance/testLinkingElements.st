tests
testLinkingElements
	"note that this test wouldn't work if testUpdatingModuleLinks does not work"

	| definitionModels |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	(definitionModels at: 'Y') dependsOnElementNamed: 'X-e2-r2-element'.
	bridge added: (definitionModels at: 'Y') elementAndEdgeLinks first in: (definitionModels at: 'Y').
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	self assert: (definitionModels at: 'Y') elementAndEdgeLinks first isValid.
	self
		assert:
			(definitionModels at: 'Y') elementAndEdgeLinks first linkedModel
				== (bridge resultingModelsFrom: (definitionModels at: 'X')) last originalElements first