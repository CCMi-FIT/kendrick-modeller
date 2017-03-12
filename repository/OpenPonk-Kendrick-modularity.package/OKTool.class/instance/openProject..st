project handling
openProject: aProject
	self assert: [ aProject isKindOf: OPProject ].
	project := aProject.
	(projectController := OPProjectController new)
		project: project;
		workbench: self.
	self updateTitle.
	project whenChanged: [ self updateTitle ].
	project beClean.
	projectController openAllDiagrams