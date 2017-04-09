hooks
createFigure
	| newFigure |
	newFigure := OKFsmStateFigure on: self model.
	newFigure controller: self.
	newFigure shape
		color: Color veryVeryLightGray;
		borderColor: Color veryVeryDarkGray.
	^ newFigure