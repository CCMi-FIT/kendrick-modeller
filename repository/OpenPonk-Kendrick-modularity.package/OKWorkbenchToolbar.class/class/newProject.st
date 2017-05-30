project handling
newProject
	| projectClasses |
	projectClasses := OKProject allSubclasses asOrderedCollection.
	projectClasses size = 1
		ifTrue: [ ^ self newProject: projectClasses first ].
	^ OKNewProjectSelectionDialog openForProjectClasses: projectClasses