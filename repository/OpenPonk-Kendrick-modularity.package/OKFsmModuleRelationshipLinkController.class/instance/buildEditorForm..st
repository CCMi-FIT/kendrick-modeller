ui hooks
buildEditorForm: aForm
	(aForm addTextInput: 'Probability')
		text: self model name;
		whenTextIsAccepted: [ :newValue |  ].
	(aForm addTextInput: 'Delay by state')
		text: self model delayStateName;
		whenTextIsAccepted: [ :newValue | self model delayStateName: newValue ].
	(aForm addTextInput: 'Delay probability')
		text: self model delayProbability;
		whenTextIsAccepted: [ :newValue | self model delayProbability: newValue ]