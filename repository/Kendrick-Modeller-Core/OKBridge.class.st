"
I connect OpenPonk-like diagrams with external models and tools able to transform them into result models. I take OpenPonk-Kendrick-modularity projects and then, when any model is added, removed or changed, I can be called to transform those original models into resulting ones.
"
Class {
	#name : #OKBridge,
	#superclass : #Object,
	#instVars : [
		'project',
		'externalModels',
		'dependingModels',
		'definitionModels',
		'resultingModels'
	],
	#category : #'Kendrick-Modeller-Core-Bridge'
}

{ #category : #accessing }
OKBridge class >> project: anOpenPonkProject [
	"create a bridge for anOpenPonkProject"
	^ self new
		project: anOpenPonkProject;
		yourself
]

{ #category : #private }
OKBridge >> addDependenciesOf: aDefinitionModel [
	"aDefinitionModel is added to values in dependingModels (so that it inditaces that something depends on aDefinitionModel)"

	aDefinitionModel moduleLinks do: [ :each | (self dependingModelsOn: each) add: aDefinitionModel ]
]

{ #category : #api }
OKBridge >> added: aDefinitionModel [
	"call this if aDefinitionModel has just been added to the project and bridge does not know about it yet"
	self addedWithoutFlags: aDefinitionModel
]

{ #category : #api }
OKBridge >> added: anElement in: aDefinitionModel [
	"call this if anElement has been added to aDefinitionModel, which is a definition model"

	self
		addDependenciesOf: aDefinitionModel;
		process: aDefinitionModel whenChanged: anElement
]

{ #category : #private }
OKBridge >> addedWithoutFlags: aDefinitionModel [
	"this method adds aDefinitionModel to the bridge and saves its dependencies"

	definitionModels add: aDefinitionModel.
	externalModels at: aDefinitionModel put: Set new.
	resultingModels at: aDefinitionModel put: Set new.
	self
		addDependenciesOf: aDefinitionModel;
		updateLinksIn: aDefinitionModel thenForceAnnounce: true
]

{ #category : #api }
OKBridge >> changed: aModelOrItsElement in: aDefinitionModel [
	"call this if aModelOrItsElement has been changed in aDiagramModel -- note that if the change was in the model itself, aModelOrItsElement and aDiagramModel should be the same object"

	self update: aDefinitionModel whenChanged: aModelOrItsElement
]

{ #category : #accessing }
OKBridge >> definitionModels [
	^ definitionModels
]

{ #category : #accessing }
OKBridge >> dependingModelsOn: aResultingModel [
	"returns set of definition models that depend on (have module link to) models with same name as has the aResultDiagram -- so probably depend on aResultDiagram, if it's not just a conicidence of names"

	^ dependingModels at: aResultingModel name ifAbsentPut: [ Set new ]
]

{ #category : #accessing }
OKBridge >> externalModels [
	^ externalModels
]

{ #category : #accessing }
OKBridge >> externalModelsOf: aDefinitionModel [
	"such external models that have been transformed from definition model aDefinitionModel"

	^ externalModels at: aDefinitionModel
]

{ #category : #private }
OKBridge >> getExternalModelsFrom: aDefinitionModel [
	"this is a method that subclasses of OKBridge have to implement and it should return an ordered collection of external models created from aDefinitionModel"

	^ self subclassResponsibility
]

{ #category : #private }
OKBridge >> getResultModelsFrom: anExternalModel madeFrom: aDefinitionModel [
	"this is a method that subclasses of OKBridge have to implement and it should return an ordered collection of resulting (OpenPonk-friendly) models created from anExternalModel that has been previously created from aDefinitionModel"

	^ self subclassResponsibility
]

{ #category : #initialization }
OKBridge >> initialize [
	super initialize.
	definitionModels := OrderedCollection new.
	externalModels := Dictionary new.
	resultingModels := Dictionary new.
	dependingModels := Dictionary new
]

{ #category : #private }
OKBridge >> modelsWithInvalidModulesExcept: aDefinitionModel [
	"returns a collection of definition models that have module links linking to models that are not amongst resulting models"

	| flatTransformedModels models |
	flatTransformedModels := resultingModels flatCollectAsSet: [ :each | each ].
	models := project models
		select: [ :eachDefinitionModel | 
			eachDefinitionModel ~~ aDefinitionModel
				and: [ eachDefinitionModel moduleLinks
						anySatisfy:
							[ :eachModule | flatTransformedModels noneSatisfy: [ :any | any name = eachModule name ] ] ] ].
	^ models
]

{ #category : #private }
OKBridge >> process: aDefinitionModel whenChanged: anElementOrModel [
	"aDefinitionModel is transformed or links are updated first (if only a link changed -- transformation of the model happens later via announcement)"

	anElementOrModel isLink
		ifTrue: [ self updateLinksIn: aDefinitionModel thenForceAnnounce: true ]
		ifFalse: [ self transform: aDefinitionModel ]
]

{ #category : #api }
OKBridge >> project: anOpenPonkProject [
	"called when created for a project"

	project := anOpenPonkProject.
	project models do: [ :each | self addedWithoutFlags: each ]
]

{ #category : #private }
OKBridge >> removeDependenciesOf: aDefinitionModel [
	"aDefinitionModel is removed from values in dependingModels (so that it not longer inditaces that something depends on aDefinitionModel)"

	dependingModels valuesDo: [ :eachSet | eachSet remove: aDefinitionModel ifAbsent: [  ] ]
]

{ #category : #api }
OKBridge >> removed: aDefinitionModel [
	"call this if aDefinitionModel has just been removed from the project and bridge does not know about it yet"

	self removeDependenciesOf: aDefinitionModel.
	resultingModels removeKey: aDefinitionModel.
	externalModels removeKey: aDefinitionModel.
	definitionModels remove: aDefinitionModel
]

{ #category : #api }
OKBridge >> removed: anElement in: aDefinitionModel [
	"call this if anElement has been removed from aDefinitionModel, which is a definition model"

	self update: aDefinitionModel whenChanged: anElement
]

{ #category : #private }
OKBridge >> renamedLinkIn: aDefinitionModel [
	"call this if a link in aDefinitionModel gets renamed by the user"

	self updateLinksIn: aDefinitionModel thenForceAnnounce: true
]

{ #category : #accessing }
OKBridge >> resultingModels [
	^ resultingModels
]

{ #category : #accessing }
OKBridge >> resultingModelsFrom: aDefinitionModel [
	"such resulting models that have been transformed from definition model aDefinitionModel"

	^ resultingModels at: aDefinitionModel
]

{ #category : #private }
OKBridge >> transform: aDefinitionModel [
	"create external models from aDefinitionModel, then create resulting models from those external models and finally, update all relevant links to these models (or invalidate those linking to resulting model that has no new replacement)"

	| newTransformedModels |
	externalModels at: aDefinitionModel put: (self getExternalModelsFrom: aDefinitionModel).
	newTransformedModels := (externalModels at: aDefinitionModel)
		flatCollect: [ :each | self getResultModelsFrom: each madeFrom: aDefinitionModel ].
	resultingModels at: aDefinitionModel put: newTransformedModels.
	(newTransformedModels flatCollectAsSet: [ :each | self dependingModelsOn: each ])
		, (self modelsWithInvalidModulesExcept: aDefinitionModel)
		do: [ :eachDependingModel | self updateLinksIn: eachDependingModel ]
]

{ #category : #private }
OKBridge >> update: aDefinitionModel whenChanged: anElementOrModel [
	"aDefinitionModel is updated in dependingModels (so that it is only in values of models that aDefinitionModel really links to), then the model is transformed or links are updated first (if only a link changed -- transformation of the model happens later via announcement)"

	self
		removeDependenciesOf: aDefinitionModel;
		addDependenciesOf: aDefinitionModel;
		process: aDefinitionModel whenChanged: anElementOrModel
]

{ #category : #private }
OKBridge >> updateElementLinksIn: aDefinitionModel [
	"element links are updated to point to current elements in linked resulting models (not all elements in all models, just linked resulting models)"

	| setOfTransformedElements resultElementsToLink |
	setOfTransformedElements := (aDefinitionModel moduleLinks
		flatCollectAsSet: [ :each | each linkedModel elements ])
		select: [ :each | each canBeLinkedTo ].
	resultElementsToLink := (aDefinitionModel elementAndEdgeLinks
		reject: [ :eachLink | setOfTransformedElements includes: eachLink linkedModel ]
		thenCollect: [ :eachLink | 
			eachLink
				->
					(setOfTransformedElements
						detect: [ :any | eachLink canRelinkTo: any ]
						ifNone: [ OKNamedBrokenReference named: eachLink name ]) ]) asDictionary.
	resultElementsToLink
		keysAndValuesDo: [ :link :newElement | link linkedModel: newElement ]
]

{ #category : #private }
OKBridge >> updateLinksIn: aDefinitionModel [
	"update links in aDefinitionModel and then force announcement of updated links if all links in aDefinitionModel were valid before (announcement is not needed if links were not valid before and are not valid even after updating)"

	self
		updateLinksIn: aDefinitionModel
		thenForceAnnounce: (aDefinitionModel links allSatisfy: [ :each | each isValid ])
]

{ #category : #private }
OKBridge >> updateLinksIn: aDefinitionModel thenForceAnnounce: forceAnnounce [
	"this methods updates all links in anOpenPonkDiagram to point to current resulting models or to point to broken references if there are no proper model objects to link to"

	self
		updateModuleLinksIn: aDefinitionModel;
		updateElementLinksIn: aDefinitionModel.

	"if asked for, or if new model has all links valid, notify anOpenPonkDiagram that links have been updated to that is can react to it and notify that it needs to generate new resulting models"
	(forceAnnounce or: [ aDefinitionModel links allSatisfy: [ :each | each isValid ] ])
		ifTrue: [ aDefinitionModel linksUpdated ]
]

{ #category : #private }
OKBridge >> updateModuleLinksIn: aDefinitionModel [
	"module links are updated to point to current resulting models"

	| setOfTransformedDiagrams resultDiagramsToLink |
	setOfTransformedDiagrams := (resultingModels
		flatCollectAsSet: [ :eachTransformedSet | eachTransformedSet ])
		select: [ :each | each canBeValidLinkedTo ].
	resultDiagramsToLink := (aDefinitionModel moduleLinks
		reject: [ :eachLink | setOfTransformedDiagrams includes: eachLink linkedModel ]
		thenCollect: [ :eachLink | 
			eachLink
				->
					(setOfTransformedDiagrams
						detect: [ :any | eachLink canRelinkTo: any ]
						ifNone: [ OKNamedBrokenReference named: eachLink name ]) ]) asDictionary.
	resultDiagramsToLink
		keysAndValuesDo: [ :module :newDiagram | module linkedModel: newDiagram ]
]
