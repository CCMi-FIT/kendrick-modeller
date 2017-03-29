private
feedbackFor: anObject color: aColor
	(anObject isKindOf: RTElement)
		ifTrue: [ ^ OKElementADFeedback new feedbackFor: anObject color: aColor ].
	^ super feedbackFor: anObject color: aColor