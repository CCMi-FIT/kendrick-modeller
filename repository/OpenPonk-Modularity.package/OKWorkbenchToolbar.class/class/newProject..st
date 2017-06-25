project handling
newProject: aProjectClass
	| project projectName |
	projectName := UIManager default request: 'Project name' initialAnswer: 'New Project'.
	(projectName isNil or: [ projectName isEmpty ])
		ifTrue: [ ^ self ].
	project := aProjectClass named: projectName.
	project ifNil: [ ^ self ].
	self loadProject: project