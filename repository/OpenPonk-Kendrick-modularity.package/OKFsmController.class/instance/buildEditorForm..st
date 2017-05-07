ui hooks
buildEditorForm: aForm
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Attributes')
		text: self model attributesAsString;
		whenTextIsAccepted: [ :newValue | self model parseAttributes: newValue ]