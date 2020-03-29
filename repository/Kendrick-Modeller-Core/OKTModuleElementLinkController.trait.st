"
I am a trait defining some features of a controller of a link to an element in another diagram.
"
Trait {
	#name : #OKTModuleElementLinkController,
	#traits : 'OKTModularityLinkController',
	#classTraits : 'OKTModularityLinkController classTrait',
	#category : #'Kendrick-Modeller-Core-Controllers'
}

{ #category : #adding }
OKTModuleElementLinkController >> addAsSourceFor: aRelationshipController [
	self assert: (self canBeSourceFor: aRelationshipController).
	aRelationshipController source: self.
	aRelationshipController model
		ifNotNil: [ aRelationshipController model source: self model ]
]

{ #category : #adding }
OKTModuleElementLinkController >> addAsTargetFor: aRelationshipController [
	self assert: (self canBeTargetFor: aRelationshipController).
	aRelationshipController target: self.
	aRelationshipController model
		ifNotNil: [ aRelationshipController model target: self model ].
	aRelationshipController attachTo: self diagramController.
	self model owner add: aRelationshipController model
]

{ #category : #hooks }
OKTModuleElementLinkController >> createFigure [
	"TODO... As you can see, I have hardcoded shape (figure) for now end even depend on Kendrick package because of that! Shame on me! I should not provide any shape at all and leave it on my subclasses or at least create my own."

	| newFigure |
	newFigure := OKFsmStateFigure
		on: self model.
	newFigure controller: self.
	newFigure shape
		colorElement: [ :anElement | 
			self model isValid
				ifTrue: [ Color veryVeryLightGray ]
				ifFalse: [ Color red ] ];
		borderColor: Color veryVeryDarkGray.
	^ newFigure
]

{ #category : #hooks }
OKTModuleElementLinkController >> refreshFigure [
	self figure update.
	super refreshFigure
]
