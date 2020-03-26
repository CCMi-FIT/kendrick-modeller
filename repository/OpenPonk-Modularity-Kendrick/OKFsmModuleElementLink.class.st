Class {
	#name : #OKFsmModuleElementLink,
	#superclass : #OKModuleElementLink,
	#instVars : [
		'splitIndexes'
	],
	#category : 'OpenPonk-Modularity-Kendrick-Models'
}

{ #category : #converting }
OKFsmModuleElementLink >> asCompartmentDictionary [
	^ linkedModel asCompartmentDictionary
]

{ #category : #'DynaCASE-FSM-GraphML-accessing' }
OKFsmModuleElementLink >> graphmlType [
	^ #elementlink
]

{ #category : #testing }
OKFsmModuleElementLink >> hasEditableName [
	^ false
]

{ #category : #accessing }
OKFsmModuleElementLink >> incoming [
	owner ifNil: [ ^ #() ].
	^ owner transitions select: [ :each | each target = self ]
]

{ #category : #initialization }
OKFsmModuleElementLink >> initialize [
	super initialize.
	splitIndexes := OrderedCollection new
]

{ #category : #accessing }
OKFsmModuleElementLink >> isSplitDefined [
	^ splitIndexes isInterval or: [ splitIndexes isNotEmpty ]
]

{ #category : #testing }
OKFsmModuleElementLink >> isState [
	^ true
]

{ #category : #testing }
OKFsmModuleElementLink >> isTransition [
	^ false
]

{ #category : #testing }
OKFsmModuleElementLink >> kendrickAttributeType [
	^ self linkedModel kendrickAttributeType
]

{ #category : #accessing }
OKFsmModuleElementLink >> outgoing [
	owner ifNil: [ ^ #() ].
	^ owner transitions select: [ :each | each source = self ]
]

{ #category : #accessing }
OKFsmModuleElementLink >> parseSplitIndexes: aString [
	(self tryParseIntervalFrom: aString)
		ifNotNil: [ :interval | ^ self splitIndexes: interval ].
	self splitIndexes: ((aString splitOn: Character space) reject: [ :each | each isEmpty ])
]

{ #category : #accessing }
OKFsmModuleElementLink >> relatedElements [
	^ (self incoming , self outgoing) asSet asOrderedCollection
]

{ #category : #accessing }
OKFsmModuleElementLink >> splitIndexes [
	^ splitIndexes
]

{ #category : #accessing }
OKFsmModuleElementLink >> splitIndexes: anObject [
	splitIndexes := anObject.
	self changed
]

{ #category : #accessing }
OKFsmModuleElementLink >> splitIndexesAsString [
	^ String
		streamContents: [ :stream | 
			splitIndexes isInterval
				ifTrue: [ stream << splitIndexes first << ' - ' << splitIndexes last ]
				ifFalse: [ splitIndexes asStringOn: stream delimiter: ' ' ] ]
]

{ #category : #private }
OKFsmModuleElementLink >> tryParseIntervalFrom: aString [
	| pair |
	pair := aString splitOn: $-.
	pair size = 2
		ifFalse: [ ^ nil ].
	^ Interval from: (Number readFrom: pair first trim ifFail: [ ^ nil ]) to: (Number readFrom: pair second trim ifFail: [ ^ nil ])
]
