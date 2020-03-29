Class {
	#name : #OKFsmEmptyStatusController,
	#superclass : #OKFsmStatusController,
	#category : #'Kendrick-Modeller-Kendrick-Controllers'
}

{ #category : #forms }
OKFsmEmptyStatusController >> buildEditorForm: aForm [
	aForm addLabel: 'Empty status'
]

{ #category : #accessing }
OKFsmEmptyStatusController >> modelClass [
	^ OKFsmEmptyStatus
]
