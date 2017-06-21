project handling
openEditorOn: aModel
	(self projectController hasDiagram: aModel)
		ifTrue: [ editWorkspace focusEditorOf: aModel.
			^ self ].
	editWorkspace openEditorOn: aModel