ui hooks
buildEditorForm: aForm
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Parameters')
		text: self model parametersAsString;
		whenTextIsAccepted: [ :newValue | self model parseParameters: newValue ]