"
I am a trait defining some features of modular diagram's controller.
"
Trait {
	#name : #OKTModularDiagramController,
	#category : 'OpenPonk-Modularity-Controllers'
}

{ #category : #'controllers management' }
OKTModularDiagramController >> controllerForLinkedModel: aModel [
	"similar to OPDiagramController>>#controllerForModel:, just to answer link controllers for given models, not usual controllers"

	aModel = self model originalModelObject
		ifTrue: [ ^ self ].
	^ self controllers
		detect: [ :any | any model originalModelObject = aModel ]
		ifNone: [ self error: 'There is no link to ' , aModel asString , ' in ' , self asString ]
]

{ #category : #testing }
OKTModularDiagramController >> includesModel: aModelElement [
	[ self controllerForModel: aModelElement ]
		on: NotFound
		do: [ ^ false ].
	^ true
]

{ #category : #testing }
OKTModularDiagramController >> isViewOnly [
	"is this diagram open to view only -- ie no edits are allowed?"
	
	^ self editor isViewOnly
]

{ #category : #adding }
OKTModularDiagramController >> link: aModel [
	"first link all model objects that aModel depends on, then link aModel"

	self
		linkDependenciesOf: aModel;
		linkWithoutDependencies: aModel
]

{ #category : #accessing }
OKTModularDiagramController >> linkControllerNameFor: aModularityLink [
	"despite the name, this method returns a class (not a name) of controller for aModularityLink"

	^ self shouldBeImplemented
]

{ #category : #'private - adding' }
OKTModularDiagramController >> linkDependenciesOf: aModel [
	"link all model objects that aModel depends on"

	(aModel dependingOnElements difference: self model originalModelObjects)
		do: [ :each | self link: each ]
]

{ #category : #adding }
OKTModularDiagramController >> linkRecursively: aModel [
	"first link all model objects that aModel depends on, then link aModel, and while doing all that, link all elements that depend on newly linked ones that have even all other dependencies linked"

	self
		linkRecursivelyDependenciesOf: aModel;
		linkRecursivelyWithDepending: aModel
]

{ #category : #'private - adding' }
OKTModularDiagramController >> linkRecursivelyDependenciesOf: aModel [
	"link all model objects that aModel depends on and while doing all that, link all elements that depend on newly linked ones that have even all other dependencies linked"
	
	(aModel dependingOnElements difference: self linkedModels) do: [ :each | self linkRecursively: each ]
]

{ #category : #'private - adding' }
OKTModularDiagramController >> linkRecursivelyWithDepending: aModel [
	"link aModel and recursively also all elements that depend on aModel that have even all other dependencies linked"
	
	| alreadyLinked |
	alreadyLinked := self linkedModels.
	(alreadyLinked includes: aModel)
		ifTrue: [ ^ self ].
	self linkWithoutDependencies: aModel.
	alreadyLinked add: aModel.
	aModel dependingElements
		select: [ :each | alreadyLinked includesAll: each dependingOnElements ]
		thenDo: [ :each | self linkRecursivelyWithDepending: each ]
]

{ #category : #'private - adding' }
OKTModularDiagramController >> linkWithoutDependencies: aModel [
	"just link aModel, do not care for dependencies"
	
	((self linkControllerNameFor: aModel) linkedModel: aModel) addTo: self
]

{ #category : #accessing }
OKTModularDiagramController >> linkedModels [
	^ self model linkedModels
]

{ #category : #accessing }
OKTModularDiagramController >> project [
	^ self editor workbench projectController project
]

{ #category : #'events - registering' }
OKTModularDiagramController >> registerModelEvents: aDiagramModel [
	super registerModelEvents: aDiagramModel.
	aDiagramModel
		when: OPElementAdded
		do: [ :event | 
			(self includesModel: event element)
				ifFalse: [ self addModelElement: event element ] ].
	aDiagramModel when: OPModelContentReplaced do: [ :event | self updateView ]
]

{ #category : #hooks }
OKTModularDiagramController >> selectPossibleElementsFromModules [
	"return all linkable elements that are present in linked modules, but are not linked already"
	
	| existingLinks includedElements |
	includedElements := (self model modules
		flatCollect: [ :eachModule | eachModule linkedElements ])
		select: [ :each | each canBeValidLinkedTo ].
	existingLinks := self model links collect: #linkedModel.
	^ (includedElements difference: existingLinks) asOrderedCollection
]

{ #category : #hooks }
OKTModularDiagramController >> selectPossibleModules [
	"return all linkable resulting models that are not already linked -- note that this condition should be removed for hierarchial models, where a single model can be linked multiple times"
	
	^ (self project resultModels
		reject: [ :eachModel | 
			eachModel name == self model name
				or: [ eachModel canBeValidLinkedTo not
						or: [ self model originalModelObjects includes: eachModel ] ] ]) asOrderedCollection
]
