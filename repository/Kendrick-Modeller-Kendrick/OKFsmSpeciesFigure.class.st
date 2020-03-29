"
I am here to be drawn on canvas as species.
"
Class {
	#name : #OKFsmSpeciesFigure,
	#superclass : #OKFsmStateFigure,
	#instVars : [
		'innerCircle'
	],
	#category : #'Kendrick-Modeller-Kendrick-Figures'
}

{ #category : #'creating - subelements' }
OKFsmSpeciesFigure >> createOwnedElements [
	super createOwnedElements.
	innerCircle := RTRoundedBox new
		size: 44;
		borderRadius: 22;
		borderWidth: 1;
		color: Color transparent;
		borderColor: Color black;
		element.
	self add: innerCircle.
	(RTConstraint on: innerCircle background: self) stick
]
