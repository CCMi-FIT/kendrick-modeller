figures
refreshFigure
	| trachelShape index space width modules |
	(self figure attributeAt: #RTLabelledLabel)
		setAsFixed;
		text: self model name.
	trachelShape := self figure trachelShape.
	modules := (self diagramController controllers collect: [ :each | each model ] thenSelect: [ :each | each isKindOf: self modelClass ])
		asSortedCollection: [ :a :b | a name < b name ].
	index := modules indexOf: self model.
	space := trachelShape height / 2.
	width := trachelShape width.
	trachelShape translateTo: (space * index + (width * (index - (1 / 2)))) @ trachelShape height.
	super refreshFigure