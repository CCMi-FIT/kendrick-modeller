"
I am an OpenPonk-friendly representation of Kendrick model (KEModel).
"
Class {
	#name : #OKFsmKendrickModel,
	#superclass : #OKFsm,
	#instVars : [
		'populationSize',
		'simulationDuration',
		'simulateStates',
		'views',
		'simulationStepSize'
	],
	#category : 'OpenPonk-Modularity-Kendrick-Models'
}

{ #category : #hooks }
OKFsmKendrickModel class >> classFor: aKendrickModel [
	^ self
]

{ #category : #accessing }
OKFsmKendrickModel >> addView: aView [
	views add: aView
]

{ #category : #initialization }
OKFsmKendrickModel >> initialize [
	super initialize.
	views := OrderedCollection new.
	populationSize := 0.
	simulateStates := OrderedCollection new.
	simulationDuration := 0.
	simulationStepSize := 0.
]

{ #category : #testing }
OKFsmKendrickModel >> isSimulationDefined [
	^ additionalCode trim isNotEmpty
		and: [ populationSize > 0
				and: [ simulateStates isNotEmpty and: [ simulationDuration > 0 and: [ simulationStepSize > 0 ] ] ] ]
]

{ #category : #hooks }
OKFsmKendrickModel >> kendrickClass [
	^ KEModel
]

{ #category : #accessing }
OKFsmKendrickModel >> parseSimulateStates: aString [
	self simulateStates: ((aString splitOn: Character space) reject: [ :each | each isEmpty ])
]

{ #category : #accessing }
OKFsmKendrickModel >> populationSize [
	^ populationSize
]

{ #category : #accessing }
OKFsmKendrickModel >> populationSize: anInteger [
	populationSize := anInteger.
	self changed
]

{ #category : #accessing }
OKFsmKendrickModel >> simulateStates [
	^ simulateStates
]

{ #category : #accessing }
OKFsmKendrickModel >> simulateStates: aCollection [
	simulateStates := aCollection.
	self changed
]

{ #category : #accessing }
OKFsmKendrickModel >> simulateStatesAsString [
	^ String streamContents: [ :stream | simulateStates asStringOn: stream delimiter: ' ' ]
]

{ #category : #accessing }
OKFsmKendrickModel >> simulationDuration [
	^ simulationDuration
]

{ #category : #accessing }
OKFsmKendrickModel >> simulationDuration: anInteger [
	simulationDuration := anInteger.
	self changed
]

{ #category : #accessing }
OKFsmKendrickModel >> simulationStepSize [
	^ simulationStepSize
]

{ #category : #accessing }
OKFsmKendrickModel >> simulationStepSize: anInteger [
	simulationStepSize := anInteger.
	self changed
]

{ #category : #accessing }
OKFsmKendrickModel >> views [
	^ views
]
