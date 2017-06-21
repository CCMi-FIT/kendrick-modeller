specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :col | 
			col
				add: #topLabel height: 10;
				add: #codeArea;
				add: #bottomLabel height: 10 ];
		yourself