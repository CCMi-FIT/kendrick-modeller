ui hooks
buildEditorForm: aForm
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Population size')
		text: (self model populationSize ifNil: [ '' ]);
		whenTextIsAccepted: [ :newValue | self model populationSize: (NumberParser parse: newValue onError: [ nil ]) ].
	(aForm addButton: 'Additional code') action: [ self openAdditionalCodeEditor ]