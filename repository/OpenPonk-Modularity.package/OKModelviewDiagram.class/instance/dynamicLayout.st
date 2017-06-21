building widgets
dynamicLayout
	^ SpecLayout composed
		newRow: [ :row | 
			editor ifNotNil: [ row add: #editor ].
			formModel ifNotNil: [ row add: #formModel width: 180 ] ];
		yourself