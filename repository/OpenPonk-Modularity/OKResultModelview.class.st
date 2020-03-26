Class {
	#name : #OKResultModelview,
	#superclass : #OKModelviewDiagram,
	#category : 'OpenPonk-Modularity-Spec'
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
