"
I am topmost window of the application, and provide the main entry point of the application itself. Except of toolbars, I consist of a few workspaces, each for different purpose (like editing models and viewing results).
"
Class {
	#name : #OKWorkbench,
	#superclass : #ComposableModel,
	#instVars : [
		'topToolbar',
		'project',
		'projectController',
		'diffToolbar',
		'pluginRegistry',
		'editWorkspace',
		'resultWorkspace'
	],
	#category : #'Kendrick-Modeller-Core-Spec'
}

{ #category : #specs }
OKWorkbench class >> defaultSpec [
	^ SpecLayout composed
		newRow: [ :row | row newColumn: [ :col | col add: #topToolbar ] ]
			height: self toolbarHeight;
		newRow: [ :row | 
			row
				newColumn: [ :col | col add: #editWorkspace ];
				addSplitter;
				newColumn: [ :col | col add: #resultWorkspace ] ]
			top: self toolbarHeight
		"	bottom: self toolbarHeight;
		newRow: [ :row | row add: #diffToolbar ]
			origin: 0 @ 1
			corner: 0 @ 1
			offsetOrigin: 0 @ self toolbarHeight negated
			offsetCorner: 500 @ 0";
		yourself
]

{ #category : #'world menu' }
OKWorkbench class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'OpenPonk-Modularity')
		icon: OPIcons current dynacaseIcon;
		action: [ self open ];
		withSeparatorAfter
]

{ #category : #'instance creation' }
OKWorkbench class >> open [
	^ self new open
]

{ #category : #'project handling' }
OKWorkbench class >> openProject: aProject [
	^ self open
		openProject: aProject;
		yourself
]

{ #category : #accessing }
OKWorkbench >> diffToolbar [
	^ diffToolbar
]

{ #category : #accessing }
OKWorkbench >> editWorkspace [
	^ editWorkspace
]

{ #category : #api }
OKWorkbench >> initialExtent [
	^ 1850 @ 900
]

{ #category : #initialization }
OKWorkbench >> initialize [
	pluginRegistry := OPPluginRegistry default.
	super initialize
]

{ #category : #initialization }
OKWorkbench >> initializeWidgets [
	topToolbar := self instantiate: OKWorkbenchToolbar.
	editWorkspace := self instantiate: OKEditWorkspace.
	resultWorkspace := self instantiate: OKResultWorkspace.
	diffToolbar := self instantiate: OKDiffToolbar.
	editWorkspace workbench: self.
	resultWorkspace workbench: self
]

{ #category : #'instance creation' }
OKWorkbench >> open [
	self openWithSpec
]

{ #category : #'project handling' }
OKWorkbench >> openEditorOn: aModel [
	(self projectController hasDiagram: aModel)
		ifTrue: [ editWorkspace focusEditorOf: aModel.
			^ self ].
	editWorkspace openEditorOn: aModel
]

{ #category : #'project handling' }
OKWorkbench >> openProject: aProject [
	self assert: [ aProject isKindOf: OKProject ].
	project := aProject.
	(projectController := OKProjectController new)
		project: project;
		workbench: self.
	self updateTitle.
	project whenChanged: [ self updateTitle ].
	projectController openAllDiagrams.
	project models ifNotEmpty: [ :models | editWorkspace focusEditorOf: models last ].
	project resultingModels ifNotEmpty: [ :models | resultWorkspace focusEditorOf: models last ].
	project whenUpdatedResultsDo: [ resultWorkspace updateAllFrom: project ]
]

{ #category : #'project handling' }
OKWorkbench >> openResultEditorOn: aModel [
	(self projectController hasResultDiagram: aModel)
		ifTrue: [ resultWorkspace focusEditorOf: aModel.
			^ self ].
	resultWorkspace openEditorOn: aModel
]

{ #category : #accessing }
OKWorkbench >> pluginRegistry [
	^ pluginRegistry
]

{ #category : #accessing }
OKWorkbench >> projectController [
	^ projectController
]

{ #category : #accessing }
OKWorkbench >> resultWorkspace [
	^ resultWorkspace
]

{ #category : #api }
OKWorkbench >> title [
	^ String
		streamContents: [ :stream | 
			project
				ifNotNil: [ stream
						nextPutAll: project name;
						nextPutAll: ' - ' ].
			stream nextPutAll: 'OpenPonk-Modularity'.
			project
				ifNotNil: [ stream
						nextPutAll: ' for ';
						nextPutAll: project typeName ] ]
]

{ #category : #accessing }
OKWorkbench >> topToolbar [
	^ topToolbar
]

{ #category : #accessing }
OKWorkbench >> workbench [
	^ self
]
