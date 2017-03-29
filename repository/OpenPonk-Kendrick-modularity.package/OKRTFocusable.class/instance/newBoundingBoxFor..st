instance creation
newBoundingBoxFor: anElement
	| boundingBox |
	boundingBox := super newBoundingBoxFor: anElement.
	anElement isFixed
		ifTrue: [ boundingBox setAsFixed ].
	^ boundingBox