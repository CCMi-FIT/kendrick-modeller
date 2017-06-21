building widgets
dynamicLayout
	^ SpecLayout composed
		newRow: [ :col | editor ifNotNil: [ col add: #editor ] ];
		yourself