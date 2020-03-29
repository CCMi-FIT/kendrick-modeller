"
I am a project class for Kendrick.
"
Class {
	#name : #OKFsmProject,
	#superclass : #OKProject,
	#category : #'Kendrick-Modeller-Kendrick-Models'
}

{ #category : #hooks }
OKFsmProject class >> bridgeClass [
	^ OKFsmBridge
]

{ #category : #accessing }
OKFsmProject class >> typeName [
	^ 'Kendrick project'
]
