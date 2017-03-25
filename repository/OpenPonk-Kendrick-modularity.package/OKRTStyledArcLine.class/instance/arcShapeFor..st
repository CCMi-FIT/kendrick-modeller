rendering
arcShapeFor: anEdge
	| shape |
	shape := OKTRStyledArcShape new.
	shape
		width: width;
		radius: radius;
		from: (attachPoint startingPointOf: anEdge) to: (attachPoint endingPointOf: anEdge);
		color: (self colorFor: anEdge);
		dashes: dashes.
	^ shape