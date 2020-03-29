"
I am a transition between two states in kendrick models and concerns.
"
Class {
	#name : #OKFsmTransition,
	#superclass : #OPFsmTransition,
	#traits : 'OKTModularRelationship',
	#classTraits : 'OKTModularRelationship classTrait',
	#category : #'Kendrick-Modeller-Kendrick-Models'
}

{ #category : #'instance creation' }
OKFsmTransition class >> from: aSource to: aTarget probabilityParameter: aString [
	^ self new
		source: aSource;
		target: aTarget;
		probability: aString;
		yourself
]

{ #category : #'OpenPonk-FSM-GraphML-accessing' }
OKFsmTransition >> graphmlType [
	^ #transition
]

{ #category : #printing }
OKFsmTransition >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: '['.
	self source printOn: aStream.
	aStream nextPutAll: '->'.
	self target printOn: aStream.
	aStream nextPutAll: ']'
]

{ #category : #accessing }
OKFsmTransition >> printableProbability [
	| tempName |
	tempName := self name.
	^ (NumberParser isNumber: tempName)
		ifTrue: [ tempName ]
		ifFalse: [ tempName asSymbol storeString ]
]

{ #category : #accessing }
OKFsmTransition >> probability [
	^ self name
]

{ #category : #accessing }
OKFsmTransition >> probability: anExpression [
	self name: anExpression
]
