initialization
initializeWidgets
	codeArea := self newText.
	codeArea
		beForCode;
		acceptBlock: [ :text | self model additionalCode: text ].
	topLabel := self newLabel.
	topLabel label: '[ :model | '.
	bottomLabel := self newLabel.
	bottomLabel label: ']'