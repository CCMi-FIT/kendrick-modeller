"
I am an helper class allowing highlighting elements to indicate whether action is allowed when hovered over. I am modified to work even with fixed elements.
"
Class {
	#name : #OKAcceptDenyFeedbackBuilder,
	#superclass : #OPAcceptDenyFeedbackBuilder,
	#category : 'OpenPonk-Modularity-Roassal2'
}

{ #category : #private }
OKAcceptDenyFeedbackBuilder >> feedbackFor: anObject color: aColor [
	(anObject isKindOf: RTElement)
		ifTrue: [ ^ OKElementADFeedback new feedbackFor: anObject color: aColor ].
	^ super feedbackFor: anObject color: aColor
]
