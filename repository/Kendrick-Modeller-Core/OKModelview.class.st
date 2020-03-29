"
I am a main part of the OKModelspace. I have different subclass for any kind of view the user needs. I can be used to display a diagram for modelling (editing), for displaying results, for coding using DSL, defining or showing simulations and many more (if someone makes me a proper subclass :) ). For that, I have different kinds of editors and other ways of displaying, where most usual one is OKEditor.
"
Class {
	#name : #OKModelview,
	#superclass : #DynamicComposableModel,
	#instVars : [
		'modelspace',
		'editor'
	],
	#category : #'Kendrick-Modeller-Core-Spec'
}

{ #category : #specs }
OKModelview class >> defaultSpec [
	^ SpecLayout composed
]

{ #category : #private }
OKModelview class >> editorClass [
	^ self subclassResponsibility
]

{ #category : #hooks }
OKModelview class >> label [
	^ self subclassResponsibility
]

{ #category : #api }
OKModelview >> buildWithSpec [
	^ self buildWithSpecLayout: self dynamicLayout
]

{ #category : #opening }
OKModelview >> closeEditorOf: aModel [
	self workspace closeEditorOf: aModel.
	editor := nil
]

{ #category : #'private - building widgets' }
OKModelview >> createWidgets [
	editor ifNotNil: [ self assign: editor to: #editor ]
]

{ #category : #'building widgets' }
OKModelview >> dynamicLayout [
	^ SpecLayout composed
		newRow: [ :col | editor ifNotNil: [ col add: #editor ] ];
		yourself
]

{ #category : #opening }
OKModelview >> focusEditorOf: aModel [
	self workspace focusEditorOf: aModel
]

{ #category : #accessing }
OKModelview >> modelspace [
	^ modelspace
]

{ #category : #accessing }
OKModelview >> modelspace: aModelspace [
	modelspace := aModelspace
]

{ #category : #opening }
OKModelview >> openEditorOn: aModel [
	self subclassResponsibility
]

{ #category : #accessing }
OKModelview >> otherWorkspace [
	^ self workspace otherWorkspace
]

{ #category : #accessing }
OKModelview >> pluginRegistry [
	^ self workbench pluginRegistry
]

{ #category : #accessing }
OKModelview >> projectController [
	^ self workbench projectController
]

{ #category : #'building widgets' }
OKModelview >> rebuildWidget [
	self widgets removeAll.
	self createWidgets.
	self needFullRebuild: false.
	^ self buildWithSpec
]

{ #category : #updating }
OKModelview >> tabDeleted [
	editor tabDeleted
]

{ #category : #accessing }
OKModelview >> workbench [
	^ modelspace workbench
]

{ #category : #accessing }
OKModelview >> workspace [
	^ modelspace workspace
]
