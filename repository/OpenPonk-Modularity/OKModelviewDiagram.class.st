"
I am a type of Modelview that serves for displaying model as a diagram.
"
Class {
	#name : #OKModelviewDiagram,
	#superclass : #OKModelview,
	#instVars : [
		'formModel'
	],
	#category : 'OpenPonk-Modularity-Spec'
}

{ #category : #'private - building widgets' }
OKModelviewDiagram >> createWidgets [
	super createWidgets.
	formModel ifNotNil: [ self assign: formModel to: #formModel ]
]

{ #category : #'building widgets' }
OKModelviewDiagram >> dynamicLayout [
	^ SpecLayout composed
		newRow: [ :row | 
			editor ifNotNil: [ row add: #editor ].
			formModel ifNotNil: [ row add: #formModel width: 180 ] ];
		yourself
]

{ #category : #'accessing - spec' }
OKModelviewDiagram >> formModel [
	^ formModel
]

{ #category : #initialization }
OKModelviewDiagram >> initializeWidgets [
	super initializeWidgets.
	formModel := self instantiateDynamicForm.
	formModel whenBuiltDo: [ :ann | ann widget color: Color veryVeryLightGray ]
]

{ #category : #initialization }
OKModelviewDiagram >> instantiateDynamicForm [
	^ self subclassResponsibility
]

{ #category : #opening }
OKModelviewDiagram >> openEditorOn: aModel [
	editor := self instantiate: self class editorClass.
	editor workbench: self.
	editor plugin: (self pluginRegistry pluginFor: aModel).
	self rebuildWidget.
	editor openModel: aModel
]

{ #category : #opening }
OKModelviewDiagram >> openFormOn: aController [
	^ formModel
		editController: aController;
		yourself
]
