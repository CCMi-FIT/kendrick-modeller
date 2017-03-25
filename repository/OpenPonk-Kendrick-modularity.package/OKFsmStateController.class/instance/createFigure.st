hooks
createFigure
	^ (OKFsmStateFigure on: self model)
		controller: self;
		yourself