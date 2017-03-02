initialization
initializeWidgets
	noRadio := self newRadioButton.
	noRadio label: 'No diff'.
	lastRadio := self newRadioButton.
	lastRadio label: 'Last change'.
	allRadio := self newRadioButton.
	allRadio label: 'All changes'.
	resetButton := self newButton.
	resetButton label: 'Clear diff'.
	radios := RadioButtonGroup new
		addRadioButton: noRadio;
		addRadioButton: lastRadio;
		addRadioButton: allRadio;
		default: noRadio;
		yourself