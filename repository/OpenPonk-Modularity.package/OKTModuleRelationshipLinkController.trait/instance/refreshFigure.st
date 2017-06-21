figures
refreshFigure
	self figure update.
	self figure from = self figure to
		ifTrue: [ (self figure attributeAt: self className)
				model: self model name;
				update ]
		ifFalse: [ self figureLabel: #name text: self model name ].
	super refreshFigure