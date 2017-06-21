specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | row newColumn: [ :col | col add: #topToolbar ] ]
			height: self toolbarHeight;
		newRow: [ :row | 
			row
				newColumn: [ :col | col add: #editWorkspace ];
				addSplitter;
				newColumn: [ :col | col add: #resultWorkspace ] ]
			top: self toolbarHeight
		"	bottom: self toolbarHeight;
		newRow: [ :row | row add: #diffToolbar ]
			origin: 0 @ 1
			corner: 0 @ 1
			offsetOrigin: 0 @ self toolbarHeight negated
			offsetCorner: 500 @ 0";
		yourself