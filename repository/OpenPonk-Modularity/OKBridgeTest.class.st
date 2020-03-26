"
An OKBridgeTest is a test class for testing the behavior of OKBridge
"
Class {
	#name : #OKBridgeTest,
	#superclass : #TestCase,
	#instVars : [
		'bridge'
	],
	#category : 'OpenPonk-Modularity-Tests'
}

{ #category : #tests }
OKBridgeTest >> setUp [
	bridge := OKDummyBridgeSubclass new
]

{ #category : #tests }
OKBridgeTest >> testBasicCreationWithProject [
	"if this one does not run, nothing else should"
	
	bridge project: OKDummyProject new.
	self assert: bridge definitionModels size equals: 2.
	self assert: (bridge definitionModels anySatisfy: [ :any | any name = 'X' ]).
	self assert: (bridge definitionModels anySatisfy: [ :any | any name = 'Y' ])
]

{ #category : #tests }
OKBridgeTest >> testBreakingDependentLinks [
	"note that this test wouldn't work if testBreakingElementLinks does not work"

	| definitionModels |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ])
		as: Dictionary.
	(definitionModels at: 'Y') dependsOnElementNamed: 'X-e2-r2-element'.
	bridge
		added: (definitionModels at: 'Y') elementAndEdgeLinks first
		in: (definitionModels at: 'Y').
	self assert: (definitionModels at: 'Y') moduleLinks first isValid.
	self assert: (definitionModels at: 'Y') elementAndEdgeLinks first isValid.
	(definitionModels at: 'Y') dependsOnModelNamed: 'Invalid one'.
	bridge renamedLinkIn: (definitionModels at: 'Y').
	self deny: (definitionModels at: 'Y') moduleLinks first isValid.
	self deny: (definitionModels at: 'Y') elementAndEdgeLinks first isValid
]

{ #category : #tests }
OKBridgeTest >> testBreakingElementLinks [
	"note that this test wouldn't work if testLinkingElements does not work"

	| definitionModels |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ])
		as: Dictionary.
	(definitionModels at: 'Y') dependsOnElementNamed: 'X-e2-r2-element'.
	bridge
		added: (definitionModels at: 'Y') elementAndEdgeLinks first
		in: (definitionModels at: 'Y').
	self assert: (definitionModels at: 'Y') moduleLinks first isValid.
	self assert: (definitionModels at: 'Y') elementAndEdgeLinks first isValid.
	(definitionModels at: 'Y') dependsOnElementNamed: 'Invalid one'.
	bridge renamedLinkIn: (definitionModels at: 'Y').
	self assert: (definitionModels at: 'Y') moduleLinks first isValid.
	self deny: (definitionModels at: 'Y') elementAndEdgeLinks first isValid
]

{ #category : #tests }
OKBridgeTest >> testBreakingLinks [
	"note that this test wouldn't work if testUpdatingModuleLinks does not work"

	| definitionModels |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	(definitionModels at: 'Y') moduleLinks first dummyLinkedModel: (OKNamedBrokenReference named: 'G').
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	bridge renamedLinkIn: (definitionModels at: 'Y').
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 0
]

{ #category : #tests }
OKBridgeTest >> testExternalModelsCreation [
	"note that this test wouldn't work if testResultingModelsCreation does not work"

	| definitionModels externalModelsOfX externalModelsOfY |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ])
		as: Dictionary.
	externalModelsOfX := bridge externalModelsOf: (definitionModels at: 'X').
	self assert: externalModelsOfX size equals: 2.
	self assert: externalModelsOfX first name equals: 'X-e1'.
	self assert: externalModelsOfX second name equals: 'X-e2'.
	externalModelsOfY := bridge externalModelsOf: (definitionModels at: 'Y').
	self assert: externalModelsOfY size equals: 2.
	self assert: externalModelsOfY first name equals: 'Y-e1'.
	self assert: externalModelsOfY second name equals: 'Y-e2'
]

{ #category : #tests }
OKBridgeTest >> testFixingLinks [
	"note that this test wouldn't work if testProjectWithBrokenLinks does not work"

	| project definitionModels |
	project := OKDummyProject new.
	definitionModels := (project definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	(definitionModels at: 'Y') moduleLinks first dummyLinkedModel: (OKNamedBrokenReference named: 'G').
	bridge project: project.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 0.
	(definitionModels at: 'Y') moduleLinks first dummyLinkedModel: (OKNamedBrokenReference named: 'X-e2-r2').
	bridge renamedLinkIn: (definitionModels at: 'Y').
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4
]

{ #category : #tests }
OKBridgeTest >> testLinkingElements [
	"note that this test wouldn't work if testUpdatingModuleLinks does not work"

	| definitionModels |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	(definitionModels at: 'Y') dependsOnElementNamed: 'X-e2-r2-element'.
	bridge added: (definitionModels at: 'Y') elementAndEdgeLinks first in: (definitionModels at: 'Y').
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	self assert: (definitionModels at: 'Y') elementAndEdgeLinks first isValid.
	self
		assert:
			(definitionModels at: 'Y') elementAndEdgeLinks first linkedModel
				== (bridge resultingModelsFrom: (definitionModels at: 'X')) last originalElements first
]

{ #category : #tests }
OKBridgeTest >> testProjectWithBrokenLinks [
	"note that this test wouldn't work if testUpdatingModuleLinks does not work"

	| project definitionModels |
	project := OKDummyProject new.
	definitionModels := (project definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	(definitionModels at: 'Y') moduleLinks first dummyLinkedModel: (OKNamedBrokenReference named: 'G').
	bridge project: project.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 0.
]

{ #category : #tests }
OKBridgeTest >> testResultingModelsCreation [
	"note that this test wouldn't work if testUpdatingModuleLinks does not work"

	| project definitionModels |
	project := OKDummyProject new.
	definitionModels := (project definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	(definitionModels at: 'Y') moduleLinks first dummyLinkedModel: (OKNamedBrokenReference named: 'G').
	bridge project: project.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 0.
]

{ #category : #tests }
OKBridgeTest >> testUpdatingDependentModels [
	"note that this test wouldn't work if testUpdatingResultingModels does not work"

	| definitionModels resultingModels |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	resultingModels := {('X' -> (bridge resultingModelsFrom: (definitionModels at: 'X'))).
	('Y' -> (bridge resultingModelsFrom: (definitionModels at: 'Y')))} asDictionary.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	self assert: ((resultingModels at: 'X') allSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'X')) includes: each ]).
	self assert: ((resultingModels at: 'Y') allSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'Y')) includes: each ]).
	bridge changed: (definitionModels at: 'X') in: (definitionModels at: 'X').
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	self assert: ((resultingModels at: 'X') noneSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'X')) includes: each ]).
	self assert: ((resultingModels at: 'Y') noneSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'Y')) includes: each ])
]

{ #category : #tests }
OKBridgeTest >> testUpdatingModuleLinks [
	"note that this test wouldn't work if testExternalModelsCreation does not work"

	| project definitionModels |
	project := OKDummyProject new.
	definitionModels := (project models collect: [ :each | each name -> each ]) as: Dictionary.
	self deny: (definitionModels at: 'Y') moduleLinks first isValid.
	self deny: (definitionModels at: 'Y') moduleLinks first relinked.
	bridge project: project.
	self assert: (definitionModels at: 'Y') moduleLinks first relinked.
	self assert: (definitionModels at: 'Y') moduleLinks first isValid
]

{ #category : #tests }
OKBridgeTest >> testUpdatingResultingModels [
	"note that this test wouldn't work if testResultingModelsCreation does not work"

	| definitionModels resultingModels |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	resultingModels := {('X' -> (bridge resultingModelsFrom: (definitionModels at: 'X'))).
	('Y' -> (bridge resultingModelsFrom: (definitionModels at: 'Y')))} asDictionary.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	self assert: ((resultingModels at: 'X') allSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'X')) includes: each ]).
	self assert: ((resultingModels at: 'Y') allSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'Y')) includes: each ]).
	bridge changed: (definitionModels at: 'Y') in: (definitionModels at: 'Y').
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	self assert: ((resultingModels at: 'X') allSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'X')) includes: each ]).
	self assert: ((resultingModels at: 'Y') noneSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'Y')) includes: each ])
]
