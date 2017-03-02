specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :col | 
			col
				newRow: [ :row | 
					row
						add: #noRadio;
						add: #lastRadio;
						add: #allRadio;
						add: #resetButton ] ]
			width: 500;
		yourself