project handling
newProject
	| project |
	project := OKProject
		named: (UIManager default request: 'Project name' initialAnswer: 'New Project').
	project ifNil: [ ^ self ].
	self loadProject: project