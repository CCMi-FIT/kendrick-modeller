tests
testUpdatingModuleLinks
	"note that this test wouldn't work if testExternalModelsCreation does not work"

	| project definitionModels |
	project := OKDummyProject new.
	definitionModels := (project models collect: [ :each | each name -> each ]) as: Dictionary.
	self deny: (definitionModels at: 'Y') moduleLinks first isValid.
	self deny: (definitionModels at: 'Y') moduleLinks first relinked.
	bridge project: project.
	self assert: (definitionModels at: 'Y') moduleLinks first relinked.
	self assert: (definitionModels at: 'Y') moduleLinks first isValid