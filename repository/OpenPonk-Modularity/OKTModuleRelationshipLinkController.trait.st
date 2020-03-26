"
I am a trait defining some features of a controller of a link to a relationship in another diagram.
"
Trait {
	#name : #OKTModuleRelationshipLinkController,
	#traits : 'OKTModularityLinkController',
	#classTraits : 'OKTModularityLinkController classTrait',
	#category : 'OpenPonk-Modularity-Controllers'
}

{ #category : #adding }
OKTModuleRelationshipLinkController >> addTo: aDiagramController [
	(aDiagramController controllerForLinkedModel: self linkedModel source)
		addAsSourceFor: self.
	(aDiagramController controllerForLinkedModel: self linkedModel target)
		addAsTargetFor: self
]

{ #category : #figures }
OKTModuleRelationshipLinkController >> createEdgeFrom: fromElement to: toElement [
	^ OPRTCallbackBuilder
		block: [ :view | 
			fromElement = toElement
				ifTrue: [ self createSelfEdgeFor: fromElement inView: view ]
				ifFalse: [ self createEdgeFrom: fromElement to: toElement inView: view ] ]
]

{ #category : #figures }
OKTModuleRelationshipLinkController >> createEdgeFrom: fromElement to: toElement inView: aView [
	| e |
	e := self edgeBuilder createFigureFrom: fromElement to: toElement view: aView.
	e when: TRMouseDoubleLeftClick do: [ :evt | OPRenameElementCommand executeOn: self model ].
	(e labels at: #name)
		when: TRMouseDoubleLeftClick
		do: [ :evt | OPRenameElementCommand executeOn: self model ].
	^ e
]

{ #category : #hooks }
OKTModuleRelationshipLinkController >> createFigure [
	^ self createEdgeFrom: self source figure to: self target figure
]

{ #category : #hooks }
OKTModuleRelationshipLinkController >> createModel [
	self model ifNotNil: [ ^ self model ].
	^ self modelClass from: self source model to: self target model
]

{ #category : #figures }
OKTModuleRelationshipLinkController >> createSelfEdgeFor: anElement inView: view [
	| aLabel aFigure |
	aFigure := OPRTArcLine new
		colorElement: [ :el | 
			self model isValid
				ifTrue: [ Color gray ]
				ifFalse: [ Color red ] ];
		radius: 15;
		head: RTFilledNarrowArrow;
		edgeFrom: anElement to: anElement.
	aLabel := RTLabel new
		color: Color black;
		height: 10;
		elementOn: ''.
	aFigure attributeAt: self class name put: aLabel.
	OPRTArcLine constraintLabel: aLabel at: aFigure.
	aFigure trachelShape addCallback: (TRRemoveCallback with: aLabel).
	view add: aLabel.
	aFigure @ OPRTFocusable.
	^ aFigure
]

{ #category : #figures }
OKTModuleRelationshipLinkController >> edgeBuilder [
	^ OPRTEdgeBuilder new
		arrowHead;
		attachPoint: (RTBorderAttachPoint new offset: -10);
		constraintLabel: #name balance: 0.2 offset: 12;
		colorElement: [ :el | 
			self model isValid
				ifTrue: [ Color gray ]
				ifFalse: [ Color red ] ];
		yourself
]

{ #category : #figures }
OKTModuleRelationshipLinkController >> refreshFigure [
	self figure update.
	self figure from = self figure to
		ifTrue: [ (self figure attributeAt: self className)
				model: self model name;
				update ]
		ifFalse: [ self figureLabel: #name text: self model name ].
	super refreshFigure
]
