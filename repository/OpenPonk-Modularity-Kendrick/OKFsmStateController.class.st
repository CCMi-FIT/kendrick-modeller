Class {
	#name : #OKFsmStateController,
	#superclass : #OPFsmVertexController,
	#category : 'OpenPonk-Modularity-Kendrick-Controllers'
}

{ #category : #testing }
OKFsmStateController >> canBeSourceFor: aController [
	^ (aController isKindOf: OKFsmTransitionController)
		or: [ aController isKindOf: OKModuleRelationshipLinkController ]
]

{ #category : #testing }
OKFsmStateController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : #figures }
OKFsmStateController >> createFigure [
	^ (self figureClass on: self model)
		controller: self;
		yourself
]

{ #category : #hooks }
OKFsmStateController >> figureClass [
	^ OKFsmStateFigure
]

{ #category : #figures }
OKFsmStateController >> refreshFigure [
	figure update.
	super refreshFigure
]
