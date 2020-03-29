"
I am here to be drawn on canvas as a state.
"
Class {
	#name : #OKFsmStateFigure,
	#superclass : #OPFsmAbstractStateFigure,
	#instVars : [
		'label'
	],
	#category : #'Kendrick-Modeller-Kendrick-Figures'
}

{ #category : #rendering }
OKFsmStateFigure >> addInteractions [
	self
		@ RTDraggable;
		@ OPRTFocusable
]

{ #category : #accessing }
OKFsmStateFigure >> baseShape [
	^ RTRoundedBox new
		size: 50;
		borderRadius: 25;
		borderWidth: 1.5;
		color: Color white;
		borderColor: Color black
]

{ #category : #'creating - subelements' }
OKFsmStateFigure >> createOwnedElements [
	super createOwnedElements.
	label := RTLabel new
		color: Color black;
		height: 11;
		text: [ :aFigure | aFigure model ifNil: [ '' ] ifNotNil: [ :figureModel | figureModel name ] ];
		elementOn: self.
	self add: label.
	(RTConstraint on: label background: self) stick
]
