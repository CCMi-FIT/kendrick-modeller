ui hooks
buildEditorForm: aForm
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Split with indexes')
		text: self model splitIndexes;
		whenTextIsAccepted: [ :newValue | self model splitIndexes: newValue ]