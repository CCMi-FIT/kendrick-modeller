specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | row newColumn: [ :col | col add: #topToolbar height: self toolbarHeight ] ]
			height: self toolbarHeight;
		newRow: [ :row | 
			row
				newColumn: [ :col | col add: #leftWorkspace ];
				addSplitter;
				newColumn: [ :col | col add: #rightWorkspace ] ]
			top: self toolbarHeight
			bottom: self toolbarHeight;
		newRow: [ :row | row newColumn: [ :col | col add: #diffToolbar height: self toolbarHeight ] ]
			top: 0.96
			bottom: 0;
		yourself