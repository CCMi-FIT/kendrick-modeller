"
I am a modelview that is meant for visualizations on Roassal canvas. Instead of a model, I take Roassal view as an argument of ""openEditorOn:"".
"
Class {
	#name : #OKModelviewRoassal,
	#superclass : #RoassalModel,
	#instVars : [
		'modelspace',
		'roassalView'
	],
	#category : #'Kendrick-Modeller-Core-Spec'
}

{ #category : #hooks }
OKModelviewRoassal class >> label [
	^ 'Simulation'
]

{ #category : #initialization }
OKModelviewRoassal >> initialize [
	super initialize.
	self script: [ :view :canvas | roassalView := view ]
]

{ #category : #accessing }
OKModelviewRoassal >> modelspace [
	^ modelspace
]

{ #category : #accessing }
OKModelviewRoassal >> modelspace: aModelspace [
	modelspace := aModelspace
]

{ #category : #opening }
OKModelviewRoassal >> openEditorOn: aRoassalView [
	roassalView addFromView: aRoassalView.
	roassalView @ RTDraggableView.
	roassalView @ RTZoomableView.
	roassalView setDefaultMenu.
	roassalView canvas camera focusOnCenterScaled: 700 @ 700. "yes, this line expects a canvas of this size, because it seems there is no proper way to scale, because the window has (probably) not been properly created yet"
	roassalView signalUpdate
]

{ #category : #accessing }
OKModelviewRoassal >> roassalView [
	^ roassalView
]
