project handling
openEditorOn: aModel
	(self projectController hasDiagram: aModel)
		ifTrue: [ leftWorkspace focusEditorOf: aModel.
			^ self ].
	leftWorkspace openEditorOn: aModel.
	leftWorkspace focusEditorOf: aModel.
	rightWorkspace openEditorOn: aModel