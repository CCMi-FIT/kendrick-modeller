figures
createSelfEdgeFor: anElement inView: view
	| aLabel aFigure |
	aFigure := OKRTStyledArcLine new
		color: Color black;
		radius: 15;
		dottedLine;
		head: RTEmptyNarrowArrow;
		edgeFrom: anElement to: anElement.
	aLabel := RTLabel new
		color: Color black;
		height: 10;
		elementOn: ''.
	aFigure attributeAt: #DCArcLabel put: aLabel.
	OKRTStyledArcLine constraintLabel: aLabel at: aFigure.
	aFigure trachelShape addCallback: (TRRemoveCallback with: aLabel).
	view add: aLabel.
	aFigure @ OPRTFocusable.
	^ aFigure