"
I am an helper class allowing highlighting element to indicate whether action is allowed when hovered over. I am modified to work even with fixed elements.
"
Class {
	#name : #OKElementADFeedback,
	#superclass : #OPElementADFeedback,
	#category : #'Kendrick-Modeller-Core-Roassal2'
}

{ #category : #private }
OKElementADFeedback >> feedbackFor: anElement color: aColor [
	| shape |
	(anElement isKindOf: RTElement)
		ifFalse: [ ^ self ].
	shape := RTBox new.
	anElement shape class = RTRoundedBox
		ifTrue:
			[ (shape := RTRoundedBox new) borderRadius: (anElement shape borderRadiusFor: anElement) ].
	anElement shape class = RTEllipse
		ifTrue: [ shape := RTEllipse new ].
	feedback := shape
		color: (aColor alpha: 0.2);
		borderColor: (aColor alpha: 0.2);
		element.
	noBorder
		ifTrue: [ feedback trachelShape strokeWidth: 0.
			feedback trachelShape strokePaint: Color red ].
	OPRTElementsConstraint keepExtentOf: feedback like: anElement plus: 3 @ 3.
	TRConstraint stick: feedback onTheCenterOf: anElement.
	anElement isFixed
		ifTrue: [ feedback setAsFixed ].
	anElement view add: feedback.
	anElement view signalUpdate
]
