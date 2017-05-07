figures
refreshFigure
	| trachelShape |
	(self figure attributeAt: #RTLabelledLabel)
		setAsFixed;
		text: self model name.
	trachelShape := self figure trachelShape.
	trachelShape
		translateTo: (self positionOfTrachelShape: trachelShape index: self moduleIndex).
	super refreshFigure