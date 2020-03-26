"
I am a main part of the OKWorkbench. The workbench cosists of multiple instances of me, each for different purpose. I am the one who handles tabs with each model. In these tabs are instances of OKModelspace.
"
Class {
	#name : #OKWorkspace,
	#superclass : #ComposableModel,
	#instVars : [
		'modelspaces',
		'tabManager',
		'workbench',
		'focusedModel'
	],
	#category : 'OpenPonk-Modularity-Spec'
}

{ #category : #specs }
OKWorkspace class >> defaultSpec [
	^ SpecLayout composed
		newRow: [ :row | row newColumn: [ :col | col add: #tabManager ] ];
		yourself
]

{ #category : #opening }
OKWorkspace >> closeEditorOf: aModel [
	modelspaces at: aModel ifPresent: [ :pair | tabManager removeTab: pair second ].
	aModel announcer unsubscribe: self
]

{ #category : #opening }
OKWorkspace >> focusEditorOf: aModel [
	(modelspaces at: aModel) second selected: true
]

{ #category : #accessing }
OKWorkspace >> focusedModel [
	^ focusedModel
]

{ #category : #initialization }
OKWorkspace >> initialize [
	modelspaces := IdentityDictionary new.
	super initialize
]

{ #category : #initialization }
OKWorkspace >> initializeWidgets [
	tabManager := self newTabManager
]

{ #category : #hooks }
OKWorkspace >> newModelspace [
	^ self subclassResponsibility
]

{ #category : #opening }
OKWorkspace >> openEditorOn: aModel [
	| tab plugin widget modelspace |
	modelspace := self newModelspace.
	modelspace workspace: self.
	plugin := self pluginRegistry pluginFor: aModel.
	tab := self newTab.
	tab closeable: false.
	modelspaces at: aModel put: (Array with: modelspace with: tab).
	modelspace owner: tab.
	modelspace openEditorOn: aModel.
	widget := modelspace buildWithSpec asWidget.
	aModel whenChanged: [ tab label: aModel name ].
	tab
		label: aModel name;
		icon: plugin icon;
		retrievingBlock: [ widget ];
		whenTabSelected: [ focusedModel := aModel ];
		whenBuiltDo: [ :w | 
			w widget when: #tabDeleted send: #tabDeleted to: modelspace.
			w widget when: #tabDeleted evaluate: [ :t | modelspaces removeKey: aModel ] ].
	tabManager addTab: tab
]

{ #category : #accessing }
OKWorkspace >> otherWorkspace [
	^ self subclassResponsibility
]

{ #category : #accessing }
OKWorkspace >> pluginRegistry [
	^ workbench pluginRegistry
]

{ #category : #accessing }
OKWorkspace >> tabManager [
	^ tabManager
]

{ #category : #api }
OKWorkspace >> title [
	^ self className
]

{ #category : #accessing }
OKWorkspace >> workbench [
	^ workbench
]

{ #category : #accessing }
OKWorkspace >> workbench: aWorkbench [
	workbench := aWorkbench
]

{ #category : #accessing }
OKWorkspace >> workspace [
	^ self
]
