"
I am a main part of the OKWorkspace. I cointain all possible views of a single model, each in a single inner tab of mine. Those views  are subclasses of OKModelView
"
Class {
	#name : #OKModelspace,
	#superclass : #ComposableModel,
	#instVars : [
		'tabManager',
		'workspace',
		'focusedView',
		'model'
	],
	#category : 'OpenPonk-Modularity-Spec'
}

{ #category : #specs }
OKModelspace class >> defaultSpec [
	^ SpecColumnLayout composed
		add: #tabManager;
		yourself
]

{ #category : #initialization }
OKModelspace >> createTab: aModelview for: aModel [
	| tab widget |
	aModelview modelspace: self.
	tab := self instantiate: TabModel.
	tab closeable: false.
	aModelview owner: tab.
	tab label: aModelview class label.
	tab whenTabSelected: [ focusedView := tabManager tabs indexOf: tab ].
	widget := aModelview buildWithSpec asWidget.
	tab retrievingBlock: [ widget ].
	tabManager addTab: tab.
	aModelview openEditorOn: aModel.
	^ tab
]

{ #category : #hooks }
OKModelspace >> defaultModelviews [
	^ self subclassResponsibility
]

{ #category : #accessing }
OKModelspace >> focusView: anInteger [
	(tabManager tabs at: anInteger ifAbsent: [ ^ self ]) selected: true
]

{ #category : #accessing }
OKModelspace >> focusedView [
	^ focusedView
]

{ #category : #initialization }
OKModelspace >> initializeWidgets [
	tabManager := self newTabManager
]

{ #category : #accessing }
OKModelspace >> model [
	^ model
]

{ #category : #accessing }
OKModelspace >> modelspace [
	^ self
]

{ #category : #'project handling' }
OKModelspace >> openEditorOn: aModel [
	model := aModel.
	self defaultModelviews do: [ :each | self createTab: each new for: aModel ].
	aModel views do: [ :each | self createTab: OKModelviewRoassal new for: each ]
]

{ #category : #accessing }
OKModelspace >> otherWorkspace [
	^ self workspace otherWorkspace
]

{ #category : #updating }
OKModelspace >> tabDeleted [
	tabManager tabs copy do: [ :each | tabManager removeTab: each ]
]

{ #category : #accessing }
OKModelspace >> tabManager [
	^ tabManager
]

{ #category : #accessing }
OKModelspace >> workbench [
	^ workspace workbench
]

{ #category : #accessing }
OKModelspace >> workspace [
	^ workspace
]

{ #category : #accessing }
OKModelspace >> workspace: aWorkspace [
	workspace := aWorkspace
]
