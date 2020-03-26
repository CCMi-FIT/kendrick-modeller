Class {
	#name : #OKDummyModel,
	#superclass : #Object,
	#instVars : [
		'name',
		'modules',
		'elementLinks',
		'originalElements',
		'askedForLinks',
		'askedToUpdateLinks'
	],
	#category : 'OpenPonk-Modularity-Tests'
}

{ #category : #'instance creation' }
OKDummyModel class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #testing }
OKDummyModel >> askedForLinks [
	^ askedForLinks
]

{ #category : #testing }
OKDummyModel >> askedToUpdateLinks [
	^ askedToUpdateLinks
]

{ #category : #testing }
OKDummyModel >> canBeValidLinkedTo [
	^ true
]

{ #category : #accessing }
OKDummyModel >> dependsOn: aModel [
	modules := {OKDummyLink dummyLinkedModel: aModel}
]

{ #category : #accessing }
OKDummyModel >> dependsOnElementNamed: aName [
	elementLinks := {OKDummyLink dummyLinkedModel: (OKNamedBrokenReference named: aName)}
]

{ #category : #accessing }
OKDummyModel >> dependsOnModelNamed: aName [
	modules := {OKDummyLink dummyLinkedModel: (OKNamedBrokenReference named: aName)}
]

{ #category : #accessing }
OKDummyModel >> elementAndEdgeLinks [
	askedForLinks := true.
	^ elementLinks
]

{ #category : #accessing }
OKDummyModel >> elements [
	^ self links, self originalElements
]

{ #category : #initialization }
OKDummyModel >> initialize [
	super initialize.
	elementLinks := {}.
	modules := {}.
	self resetFlags
]

{ #category : #testing }
OKDummyModel >> isLink [
	^ false
]

{ #category : #accessing }
OKDummyModel >> links [
	^ self moduleLinks, self elementAndEdgeLinks
]

{ #category : #announcing }
OKDummyModel >> linksUpdated [
	askedToUpdateLinks := true
]

{ #category : #accessing }
OKDummyModel >> moduleLinks [
	^ modules
]

{ #category : #accessing }
OKDummyModel >> name [
	^ name
]

{ #category : #accessing }
OKDummyModel >> name: aString [
	name := aString.
	originalElements := {(OKDummyElement named: aString , '-element')}
]

{ #category : #accessing }
OKDummyModel >> originalElements [
	^ originalElements
]

{ #category : #printing }
OKDummyModel >> printOn: aStream [
	super printOn: aStream.
	aStream << ' (''' << self name << ''')'
]

{ #category : #accessing }
OKDummyModel >> resetFlags [
	askedForLinks := false.
	askedToUpdateLinks := false
]
