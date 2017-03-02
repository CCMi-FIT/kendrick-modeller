project handling
openEditorOn: aModel
	(self projectController hasDiagram: aModel)
		ifTrue: [ self focusEditorOf: aModel.
			^ self ].
	leftWorkspace openEditorOn: aModel.
	rightWorkspace openEditorOn: aModel.
	self focusEditorOf: aModel