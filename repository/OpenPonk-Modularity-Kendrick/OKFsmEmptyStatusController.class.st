Class {
	#name : #OKFsmEmptyStatusController,
	#superclass : #OKFsmStatusController,
	#category : 'OpenPonk-Modularity-Kendrick-Controllers'
}

{ #category : #forms }
OKFsmEmptyStatusController >> buildEditorForm: aForm [
	aForm addLabel: 'Empty status'
]

{ #category : #accessing }
OKFsmEmptyStatusController >> modelClass [
	^ OKFsmEmptyStatus
]
