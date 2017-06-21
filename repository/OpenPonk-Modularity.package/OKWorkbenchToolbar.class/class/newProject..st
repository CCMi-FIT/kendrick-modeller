project handling
newProject: aProjectClass
	| project |
	project := aProjectClass
		named: (UIManager default request: 'Project name' initialAnswer: 'New Project').
	project ifNil: [ ^ self ].
	self loadProject: project