creating - subelements
createOwnedElements
	super createOwnedElements.
	label := RTLabel new
		color: Color black;
		height: 11;
		text: [ :aFigure | aFigure model ifNil: [ '' ] ifNotNil: [ :figureModel | figureModel name ] ];
		elementOn: self.
	self add: label.
	(RTConstraint on: label background: self) stick