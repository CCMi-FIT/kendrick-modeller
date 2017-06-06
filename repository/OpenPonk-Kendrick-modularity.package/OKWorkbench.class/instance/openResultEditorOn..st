project handling
openResultEditorOn: aModel
	(self projectController hasResultDiagram: aModel)
		ifTrue: [ resultWorkspace focusEditorOf: aModel.
			^ self ].
	resultWorkspace openEditorOn: aModel