forms
buildEditorForm: aForm
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Split with indexes')
		text: self model splitIndexesAsString;
		whenTextIsAccepted: [ :newValue | self model parseSplitIndexes: newValue ]