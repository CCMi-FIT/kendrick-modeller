drawing
drawOn: athensCanvas
	athensCanvas pathTransform
		restoreAfter: [ athensCanvas setShape: self path.
			(athensCanvas setStrokePaint: color)
				width: 1;
				perform: self capStyle;
				dashes: dashes offset: 0.
			athensCanvas draw ]