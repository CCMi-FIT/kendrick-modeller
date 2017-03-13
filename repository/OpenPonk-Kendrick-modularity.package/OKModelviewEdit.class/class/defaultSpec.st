specs
defaultSpec
	^ SpecRowLayout composed
		newColumn: [ :col | col add: #tabManager ];
		addSplitter;
		newColumn: [ :col | col add: #formModel ] width: 180;
		yourself