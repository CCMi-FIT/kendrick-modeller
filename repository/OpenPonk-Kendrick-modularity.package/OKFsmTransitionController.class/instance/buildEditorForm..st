forms
buildEditorForm: aForm
	(aForm addTextInput: 'Probability')
		text: self model probabilityParameter;
		whenTextIsAccepted: [ :newValue | self model probabilityParameter: newValue ]