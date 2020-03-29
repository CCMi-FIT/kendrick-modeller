Class {
	#name : #OKModellingModelview,
	#superclass : #OKModelviewDiagram,
	#category : #'Kendrick-Modeller-Core-Spec'
}

{ #category : #private }
OKModellingModelview class >> editorClass [
	^ OKEditor
]

{ #category : #hooks }
OKModellingModelview class >> label [
	^ 'Modelling'
]

{ #category : #initialization }
OKModellingModelview >> instantiateDynamicForm [
	^ self instantiate: OPDynamicForm
]

{ #category : #opening }
OKModellingModelview >> openEditorOn: aModel [
	super openEditorOn: aModel.
	editor paletteModel rebuildWidget
]
