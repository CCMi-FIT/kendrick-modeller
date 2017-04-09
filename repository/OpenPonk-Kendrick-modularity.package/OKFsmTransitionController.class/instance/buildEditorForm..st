ui hooks
buildEditorForm: aForm
	(aForm addTextInput: 'Probability')
		text: self model probability;
		whenTextIsAccepted: [ :newValue | self model probability: newValue ]