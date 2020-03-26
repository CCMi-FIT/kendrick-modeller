Class {
	#name : #OKFsmTransitionController,
	#superclass : #OPFsmTransitionController,
	#category : 'OpenPonk-Modularity-Kendrick-Controllers'
}

{ #category : #forms }
OKFsmTransitionController >> buildEditorForm: aForm [
	(aForm addTextInput: 'Probability')
		text: self model probability;
		whenTextIsAccepted: [ :newValue | self model probability: newValue ]
]

{ #category : #accessing }
OKFsmTransitionController >> modelClass [
	^ OKFsmTransition
]

{ #category : #figures }
OKFsmTransitionController >> refreshFigure [
	super refreshFigure.
	self figure from = self figure to
		ifTrue: [ (self figure attributeAt: self className)
				model: self model printableProbability;
				update ]
		ifFalse: [ self figureLabel: #name text: self model printableProbability ]
]
