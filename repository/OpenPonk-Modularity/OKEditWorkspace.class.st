Class {
	#name : #OKEditWorkspace,
	#superclass : #OKWorkspace,
	#category : 'OpenPonk-Modularity-Spec'
}

{ #category : #hooks }
OKEditWorkspace >> newModelspace [
	^ OKEditModelspace new
]

{ #category : #accessing }
OKEditWorkspace >> otherWorkspace [
	^ self workbench resultWorkspace
]
