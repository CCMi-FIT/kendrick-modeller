hooks
createFigure
	| newFigure |
	newFigure := OKFsmStateFigure on: self model.
	newFigure controller: self.
	newFigure shape
		colorElement: [ :anElement | 
			self model isValid
				ifTrue: [ Color veryVeryLightGray ]
				ifFalse: [ Color red ] ];
		borderColor: Color veryVeryDarkGray.
	^ newFigure