project handling
openProject: aProject
	self assert: [ aProject isKindOf: OPProject ].
	project := aProject.
	(projectController := OKProjectController new)
		project: project;
		workbench: self.
	self updateTitle.
	project whenChanged: [ self updateTitle ].
	project beClean.
	projectController openAllDiagrams.
	project models
		ifNotEmpty: [ :models | 
			leftWorkspace focusEditorOf: models first.
			rightWorkspace focusEditorOf: models last ]