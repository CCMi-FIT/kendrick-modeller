figures
createFigure
	^ (self figureClass on: self model)
		controller: self;
		yourself