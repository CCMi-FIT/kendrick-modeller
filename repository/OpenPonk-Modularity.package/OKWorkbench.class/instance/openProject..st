project handling
openProject: aProject
	self assert: [ aProject isKindOf: OKProject ].
	project := aProject.
	(projectController := OKProjectController new)
		project: project;
		workbench: self.
	self updateTitle.
	project whenChanged: [ self updateTitle ].
	project beClean.
	projectController openAllDiagrams.
	project models ifNotEmpty: [ :models | editWorkspace focusEditorOf: models last ].
	project resultModels ifNotEmpty: [ :models | resultWorkspace focusEditorOf: models last ].
	project whenUpdatedResultsDo: [ resultWorkspace updateAllFrom: project ]