Class {
	#name : #OKFsmModuleRelationshipLinkController,
	#superclass : #OKModuleRelationshipLinkController,
	#category : 'OpenPonk-Modularity-Kendrick-Controllers'
}

{ #category : #forms }
OKFsmModuleRelationshipLinkController >> buildEditorForm: aForm [
	(aForm addTextInput: 'Probability')
		text: self model probability;
		whenTextIsAccepted: [ :newValue |  ];
		disable.
	(aForm addTextInput: 'Delay by state')
		text: self model delayStateName;
		whenTextIsAccepted: [ :newValue | self model delayStateName: newValue ].
	(aForm addTextInput: 'Delay probability')
		text: self model delayProbability;
		whenTextIsAccepted: [ :newValue | self model delayProbability: newValue ]
]

{ #category : #accessing }
OKFsmModuleRelationshipLinkController >> modelClass [
	^ OKFsmModuleRelationshipLink
]

{ #category : #figures }
OKFsmModuleRelationshipLinkController >> refreshFigure [
	super refreshFigure.
	self figure from = self figure to
		ifTrue: [ (self figure attributeAt: self className)
				model: self model printableProbability;
				update ]
		ifFalse: [ self figureLabel: #name text: self model printableProbability ]
]
