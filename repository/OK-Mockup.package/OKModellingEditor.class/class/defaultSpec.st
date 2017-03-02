specs
defaultSpec
	^ SpecLayout composed
		newRow:
			[ :row | 
			row
				newColumn: [ :col | col add: #tabManager ];
				addSplitter;
				newColumn: [ :col | col add: #formModel ] width: 180 ] yourself