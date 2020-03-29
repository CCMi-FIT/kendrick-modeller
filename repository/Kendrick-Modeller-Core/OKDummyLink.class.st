Class {
	#name : #OKDummyLink,
	#superclass : #Object,
	#instVars : [
		'linkedModel',
		'relinked'
	],
	#category : #'Kendrick-Modeller-Core-Tests'
}

{ #category : #accessing }
OKDummyLink class >> dummyLinkedModel: aModel [
	^ self new
		dummyLinkedModel: aModel;
		yourself
]

{ #category : #accessing }
OKDummyLink class >> linkedModel: aModel [
	^ self new
		linkedModel: aModel;
		yourself
]

{ #category : #testing }
OKDummyLink >> canRelinkTo: aModel [
	^ aModel name = linkedModel name
]

{ #category : #accessing }
OKDummyLink >> dummyLinkedModel: aModel [
	linkedModel := aModel
]

{ #category : #initialization }
OKDummyLink >> initialize [
	super initialize.
	relinked := false
]

{ #category : #testing }
OKDummyLink >> isLink [
	^ true
]

{ #category : #testing }
OKDummyLink >> isValid [
	^ linkedModel canBeValidLinkedTo
]

{ #category : #accessing }
OKDummyLink >> linkedModel [
	^ linkedModel
]

{ #category : #accessing }
OKDummyLink >> linkedModel: aModel [
	relinked := true.
	self dummyLinkedModel: aModel
]

{ #category : #accessing }
OKDummyLink >> name [
	^ linkedModel name
]

{ #category : #printing }
OKDummyLink >> printOn: aStream [
	super printOn: aStream.
	aStream << ' (''' << self name << ''')'.
	self isValid
		ifFalse: [ aStream << '[invalid]' ]
]

{ #category : #accessing }
OKDummyLink >> relinked [
	^ relinked
]

{ #category : #accessing }
OKDummyLink >> resetFlags [
	relinked := false
]
