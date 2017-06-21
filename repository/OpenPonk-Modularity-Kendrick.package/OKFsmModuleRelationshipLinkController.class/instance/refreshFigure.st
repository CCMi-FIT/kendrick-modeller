figures
refreshFigure
	super refreshFigure.
	self figure from = self figure to
		ifTrue: [ (self figure attributeAt: self className)
				model: self model printableProbability;
				update ]
		ifFalse: [ self figureLabel: #name text: self model printableProbability ]