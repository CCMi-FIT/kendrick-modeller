"
I am an modification of OpenPonk project controller and I am here to allow some of the features of OpenPonk modularity tool.

Unlike OPProject, I require that every kind of project has my own subclass to properly select a kind of allowed models, kind of bridge and few others .
"
Class {
	#name : #OKProject,
	#superclass : #OPProject,
	#instVars : [
		'enabledPlugins',
		'bridge',
		'announcer',
		'resultingModels'
	],
	#category : 'OpenPonk-Modularity-Models'
}

{ #category : #hooks }
OKProject class >> bridgeClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
OKProject class >> typeName [
	^ self subclassResponsibility
]

{ #category : #adding }
OKProject >> addModel: aModel [
	aModel
		when: OPElementChanged
			do: [ :event | 
			(event isKindOf: OKElementChangedDuplicite)
				ifFalse: [ self updateResultsForChangeOf: event element in: aModel ] ];
		when: OPElementAdded
			do: [ :event | self updateResultsForAdded: event element in: aModel ];
		when: OPElementRemoved
			do: [ :event | self updateResultsForRemoved: event element in: aModel ];
		when: OKLinkRenamed
			do: [ :event | self renamedLinkIn: aModel ].
	super addModel: aModel.
	self updateResultsForAdded: aModel
]

{ #category : #announcements }
OKProject >> announceUpdated [
	self announcer announce: OKProjectContentReplaced
]

{ #category : #accessing }
OKProject >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #hooks }
OKProject >> bridgeClass [
	^ self class bridgeClass
]

{ #category : #accessing }
OKProject >> definitionModels [
	^ self models
]

{ #category : #hooks }
OKProject >> enabledPlugins [
	^ enabledPlugins
		ifNil: [ | enabledPluginKinds |
			enabledPluginKinds := {OKFsmKendrickModelPlugin.
			OKFsmKendrickConcernPlugin}.
			enabledPlugins := OPPluginRegistry default plugins select: [ :each | enabledPluginKinds includes: each class ] ]
]

{ #category : #initialization }
OKProject >> initialize [
	super initialize.
	resultingModels := OrderedCollection new.
	bridge := self bridgeClass project: self
]

{ #category : #'instance creation' }
OKProject >> open [
	^ OKWorkbench openProject: self
]

{ #category : #removing }
OKProject >> removeModel: aModel [
	super removeModel: aModel.
	self updateResultsForRemoved: aModel.
	resultingModels removeAt: aModel
]

{ #category : #private }
OKProject >> renamedLinkIn: aModel [
	bridge renamedLinkIn: aModel
]

{ #category : #accessing }
OKProject >> resultingModels [
	^ resultingModels
]

{ #category : #accessing }
OKProject >> typeName [
	^ self class typeName
]

{ #category : #announcements }
OKProject >> unsubscribe: anObject [
	announcer unsubscribe: anObject
]

{ #category : #private }
OKProject >> updateResultDiagrams [
	| transformedModels |
	transformedModels := bridge resultingModels.
	resultingModels := models flatCollect: [ :each | transformedModels at: each ].
	self announceUpdated
]

{ #category : #private }
OKProject >> updateResultsForAdded: aModel [
	bridge added: aModel.
	self updateResultDiagrams
]

{ #category : #private }
OKProject >> updateResultsForAdded: aModelElement in: aDiagramModel [
	bridge added: aModelElement in: aDiagramModel.
	self updateResultDiagrams
]

{ #category : #private }
OKProject >> updateResultsForChangeOf: aModelElement in: aDiagramModel [
	bridge changed: aModelElement in: aDiagramModel.
	self updateResultDiagrams
]

{ #category : #private }
OKProject >> updateResultsForRemoved: aModel [
	bridge removed: aModel.
	self updateResultDiagrams
]

{ #category : #private }
OKProject >> updateResultsForRemoved: aModelElement in: aDiagramModel [
	bridge removed: aModelElement in: aDiagramModel.
	self updateResultDiagrams
]

{ #category : #announcements }
OKProject >> whenUpdatedResultsDo: aBlock [
	self announcer when: OKProjectContentReplaced do: aBlock
]
