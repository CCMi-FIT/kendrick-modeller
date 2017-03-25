as yet unclassified
createOwnedElements
	self createAdornment.
	self createVertexAdornment.
	label := RTLabel new
		color: Color black;
		height: 11;
		text: [ :m | m model name ];
		elementOn: self.
	self add: label.
	(RTConstraint on: label background: self) stick