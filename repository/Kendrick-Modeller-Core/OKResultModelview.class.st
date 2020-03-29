Class {
	#name : #OKResultModelview,
	#superclass : #OKModelviewDiagram,
	#category : #'Kendrick-Modeller-Core-Spec'
}

{ #category : #private }
OKResultModelview class >> editorClass [
	^ OKResultViewer
]

{ #category : #hooks }
OKResultModelview class >> label [
	^ 'Result'
]

{ #category : #initialization }
OKResultModelview >> instantiateDynamicForm [
	^ self instantiate: OKViewOnlyDynamicForm
]
