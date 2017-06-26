specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :col | 
			col
				add: #exampleCodeButton height: 50;
				add: #topLabel height: 10;
				add: #codeArea;
				add: #bottomLabel height: 10 ];
		yourself