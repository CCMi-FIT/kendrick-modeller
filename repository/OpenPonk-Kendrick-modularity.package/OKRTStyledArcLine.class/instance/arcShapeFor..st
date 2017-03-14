rendering
arcShapeFor: anEdge
	| shape |
	shape := OPTRArcShape new.
	shape
		width: width;
		radius: radius;
		from: (attachPoint startingPointOf: anEdge) to: (attachPoint endingPointOf: anEdge);
		color: (self colorFor: anEdge);
		dashes: dashes.
	^ shape