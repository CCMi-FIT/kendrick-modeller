Class {
	#name : #OKFsmController,
	#superclass : #OPFsmController,
	#traits : 'OKTModularDiagramController - {#addModuleButtonToPalette:. #addModuleElementButtonToPalette:}',
	#classTraits : 'OKTModularDiagramController classTrait',
	#instVars : [
		'modelToLinkControllerMapping'
	],
	#category : 'OpenPonk-Modularity-Kendrick-Controllers'
}

{ #category : #userinterface }
OKFsmController >> applyDefaultLayout [
	self applyLayout: self defaultLayout
]

{ #category : #userinterface }
OKFsmController >> applyLayout: anAlgorithm [
	| figures edges |
	self controllers ifEmpty: [ ^ self ].
	figures := self controllers select: [ :each | each model isState ] thenCollect: #figure.
	edges := (figures flatCollect: #connectedEdges) reject: [ :each | each from = each to ].
	anAlgorithm on: figures edges: edges.
	self view canvas camera focusOnCenterScaled
]

{ #category : #forms }
OKFsmController >> buildEditorForm: aForm [
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Parameters')
		text: self model parametersAsString;
		whenTextIsAccepted: [ :newValue | self model parseParameters: newValue ]
]

{ #category : #testing }
OKFsmController >> canBeTargetFor: aController [
	^ aController isKindOf: OKModuleLinkController
]

{ #category : #userinterface }
OKFsmController >> defaultLayout [
	^ RTSugiyamaLayout new
		horizontalGap: 90;
		verticalGap: 80;
		doNotAttachPoint;
		yourself
]

{ #category : #accessing }
OKFsmController >> editor: anEditor [
	self assert: (anEditor isKindOf: OPEditor).
	editor := anEditor
]

{ #category : #initialization }
OKFsmController >> initialize [
	super initialize.
	modelToLinkControllerMapping := self modelToLinkControllerMapping
]

{ #category : #accessing }
OKFsmController >> linkControllerNameFor: aModularityLink [
	^ modelToLinkControllerMapping at: aModularityLink class
]

{ #category : #accessing }
OKFsmController >> modelToControllerMapping [
	^ Dictionary new
		at: OKFsmCompartment put: OKFsmCompartmentController;
		at: OKFsmSpecies put: OKFsmSpeciesController;
		at: OKFsmStatus put: OKFsmStatusController;
		at: OKFsmEmptyStatus put: OKFsmEmptyStatusController;
		at: OKFsmTransition put: OKFsmTransitionController;
		at: OKFsmModuleLink put: OKFsmModuleController;
		at: OKFsmModuleRelationshipLink put: OKFsmModuleRelationshipLinkController;
		at: OKFsmModuleElementLink put: OKFsmModuleElementLinkController;
		yourself
]

{ #category : #accessing }
OKFsmController >> modelToLinkControllerMapping [
	^ Dictionary new
		at: OKFsmKendrickModel put: OKFsmModuleController;
		at: OKFsmKendrickConcern put: OKFsmModuleController;
		at: OKFsmTransition put: OKFsmModuleRelationshipLinkController;
		at: OKFsmCompartment put: OKFsmModuleElementLinkController;
		at: OKFsmSpecies put: OKFsmModuleElementLinkController;
		at: OKFsmStatus put: OKFsmModuleElementLinkController;
		at: OKFsmEmptyStatus put: OKFsmModuleElementLinkController;
		yourself
]

{ #category : #hooks }
OKFsmController >> selectPossibleElementsFromModules [
	"return all linkable elements that are present in linked modules, but are not linked already"
	
	| existingLinks includedElements |
	includedElements := (self model moduleLinks
		flatCollect: [ :eachModule | eachModule linkedElements ])
		select: [ :each | each canBeValidLinkedTo ].
	existingLinks := self model links collect: #linkedModel.
	^ (includedElements difference: existingLinks) asOrderedCollection
]

{ #category : #hooks }
OKFsmController >> selectPossibleModules [
	"return all linkable resulting models that are not already linked -- note that this condition should be removed for hierarchial models, where a single model can be linked multiple times"
	
	^ (self project resultingModels
		reject: [ :eachModel | 
			eachModel name == self model name
				or: [ eachModel canBeValidLinkedTo not
						or: [ self model originalModelObjects includes: eachModel ] ] ]) asOrderedCollection
]
