specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :col | col add: #list ];
		yourself