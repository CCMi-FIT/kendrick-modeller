tests
testExternalModelsCreation
	"note that this test wouldn't work if testResultingModelsCreation does not work"

	| definitionModels externalModelsOfX externalModelsOfY |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ])
		as: Dictionary.
	externalModelsOfX := bridge externalModelsOf: (definitionModels at: 'X').
	self assert: externalModelsOfX size equals: 2.
	self assert: externalModelsOfX first name equals: 'X-e1'.
	self assert: externalModelsOfX second name equals: 'X-e2'.
	externalModelsOfY := bridge externalModelsOf: (definitionModels at: 'Y').
	self assert: externalModelsOfY size equals: 2.
	self assert: externalModelsOfY first name equals: 'Y-e1'.
	self assert: externalModelsOfY second name equals: 'Y-e2'