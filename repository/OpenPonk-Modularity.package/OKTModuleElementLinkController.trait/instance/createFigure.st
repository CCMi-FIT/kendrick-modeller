hooks
createFigure
	"TODO... As you can see, I have hardcoded shape (figure) for now end even depend on Kendrick package because of that! Shame on me! I should not provide any shape at all and leave it on my subclasses or at least create my own."

	| newFigure |
	newFigure := OKFsmStateFigure
		on: self model.
	newFigure controller: self.
	newFigure shape
		colorElement: [ :anElement | 
			self model isValid
				ifTrue: [ Color veryVeryLightGray ]
				ifFalse: [ Color red ] ];
		borderColor: Color veryVeryDarkGray.
	^ newFigure