Class {
	#name : #OKDummyBridgeSubclass,
	#superclass : #OKBridge,
	#category : 'OpenPonk-Modularity-Tests'
}

{ #category : #private }
OKDummyBridgeSubclass >> getExternalModelsFrom: aDiagram [
	(aDiagram links allSatisfy: [ :any | any isValid ])
		ifFalse: [ ^ {} ].
	^ {(OKDummyModel named: aDiagram name , '-e1').
	(OKDummyModel named: aDiagram name , '-e2')}
]

{ #category : #private }
OKDummyBridgeSubclass >> getResultModelsFrom: aKendrickModel madeFrom: anOpenPonkDiagram [
	^ {(OKDummyModel named: aKendrickModel name , '-r1').
	(OKDummyModel named: aKendrickModel name , '-r2')}
]

{ #category : #private }
OKDummyBridgeSubclass >> updateLinksIn: aDefinitionModel thenForceAnnounce: forceAnnounce [
	"fake announcement from the model"

	aDefinitionModel resetFlags.
	self assert: aDefinitionModel askedToUpdateLinks not.
	super updateLinksIn: aDefinitionModel thenForceAnnounce: forceAnnounce.
	(aDefinitionModel links allSatisfy: [ :each | each isValid ])
		ifTrue: [ self assert: aDefinitionModel askedToUpdateLinks ].
	self changed: aDefinitionModel in: aDefinitionModel
]
