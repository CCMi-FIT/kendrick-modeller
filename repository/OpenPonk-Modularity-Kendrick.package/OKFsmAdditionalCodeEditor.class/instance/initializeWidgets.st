initialization
initializeWidgets
	codeArea := self newText.
	codeArea
		beForCode;
		acceptBlock: [ :text | self model additionalCode: text asString ].
	topLabel := self newLabel.
	topLabel label: '[ :model | '.
	bottomLabel := self newLabel.
	bottomLabel label: ']'.
	exampleCodeButton := self newButton
		label: 'Example SIR-mosquito code';
		action: [ codeArea
				text: self exampleCode;
				hasUnacceptedEdits: true;
				accept ];
		yourself