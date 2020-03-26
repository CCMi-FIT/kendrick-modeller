Class {
	#name : #OKFsmModuleRelationshipLink,
	#superclass : #OKModuleRelationshipLink,
	#instVars : [
		'delayStateName',
		'delayProbability'
	],
	#category : 'OpenPonk-Modularity-Kendrick-Models'
}

{ #category : #accessing }
OKFsmModuleRelationshipLink >> delayProbability [
	^ delayProbability
]

{ #category : #accessing }
OKFsmModuleRelationshipLink >> delayProbability: anObject [
	delayProbability := anObject.
	self changed
]

{ #category : #accessing }
OKFsmModuleRelationshipLink >> delayStateName [
	^ delayStateName
]

{ #category : #accessing }
OKFsmModuleRelationshipLink >> delayStateName: anObject [
	delayStateName := anObject.
	self changed
]

{ #category : #'DynaCASE-FSM-GraphML-accessing' }
OKFsmModuleRelationshipLink >> graphmlType [
	^ #relationshiplink
]

{ #category : #initialization }
OKFsmModuleRelationshipLink >> initialize [
	super initialize.
	delayProbability := ''.
	delayStateName := ''
]

{ #category : #accessing }
OKFsmModuleRelationshipLink >> isDelayDefined [
	^ delayStateName isNotEmpty and: [ delayProbability isNotEmpty ]
]

{ #category : #testing }
OKFsmModuleRelationshipLink >> isState [
	^ false
]

{ #category : #testing }
OKFsmModuleRelationshipLink >> isTransition [
	^ true
]

{ #category : #hooks }
OKFsmModuleRelationshipLink >> kendrickAttributeType [
	^ self linkedModel kendrickAttributeType
]

{ #category : #accessing }
OKFsmModuleRelationshipLink >> printableDelayProbability [
	^ (NumberParser isNumber: delayProbability)
		ifTrue: [ delayProbability ]
		ifFalse: [ delayProbability asSymbol storeString ]
]

{ #category : #accessing }
OKFsmModuleRelationshipLink >> printableProbability [
	^ self isValid
		ifTrue: [ linkedModel printableProbability ]
		ifFalse: [ '' ]
]

{ #category : #accessing }
OKFsmModuleRelationshipLink >> probability [
	^ self isValid
		ifTrue: [ linkedModel probability ]
		ifFalse: [ '' ]
]
