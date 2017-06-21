forms
buildEditorForm: aForm
	(aForm addTextInput: 'Probability')
		text: self model probability;
		whenTextIsAccepted: [ :newValue |  ];
		disable.
	(aForm addTextInput: 'Delay by state')
		text: self model delayStateName;
		whenTextIsAccepted: [ :newValue | self model delayStateName: newValue ].
	(aForm addTextInput: 'Delay probability')
		text: self model delayProbability;
		whenTextIsAccepted: [ :newValue | self model delayProbability: newValue ]