Class {
	#name : #OKEditWorkspace,
	#superclass : #OKWorkspace,
	#category : #'Kendrick-Modeller-Core-Spec'
}

{ #category : #hooks }
OKEditWorkspace >> newModelspace [
	^ OKEditModelspace new
]

{ #category : #accessing }
OKEditWorkspace >> otherWorkspace [
	^ self workbench resultWorkspace
]
