"
I am an modification of OpenPonk project  and I am here to allow some of the features of OpenPonk modularity tool.
"
Class {
	#name : #OKProjectController,
	#superclass : #OPProjectController,
	#instVars : [
		'resultControllers'
	],
	#category : #'Kendrick-Modeller-Core-Controllers'
}

{ #category : #adding }
OKProjectController >> addResultDiagramController: aController [
	resultControllers add: aController
]

{ #category : #testing }
OKProjectController >> hasResultDiagram: aDiagram [
	^ resultControllers anySatisfy: [ :each | each model = aDiagram ]
]

{ #category : #initialization }
OKProjectController >> initialize [
	super initialize.
	resultControllers := OrderedCollection new
]

{ #category : #actions }
OKProjectController >> openAllDiagrams [
	disableAutosave := true.
	project models do: [ :each | workbench openEditorOn: each ].
	project resultingModels do: [ :each | workbench openResultEditorOn: each ].
	self loadAutosave.
	disableAutosave := false
]

{ #category : #accessing }
OKProjectController >> persistenceManager [
	^ persistenceManager ifNil: [ persistenceManager := OKProjectDirectoryPersistence new ]
]

{ #category : #removing }
OKProjectController >> removeResultDiagramController: aController [
	resultControllers remove: aController
]

{ #category : #accessing }
OKProjectController >> resultControllers [
	^ resultControllers
]
