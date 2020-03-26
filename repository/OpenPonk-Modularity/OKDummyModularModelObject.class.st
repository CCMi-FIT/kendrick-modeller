Class {
	#name : #OKDummyModularModelObject,
	#superclass : #Object,
	#traits : 'OKTModularModelObject',
	#classTraits : 'OKTModularModelObject classTrait',
	#instVars : [
		'elements',
		'owner',
		'announcements',
		'name'
	],
	#category : 'OpenPonk-Modularity-Tests'
}

{ #category : #adding }
OKDummyModularModelObject >> add: anElement [
	(elements includes: anElement)
		ifTrue: [ ^ self ].
	anElement addedTo: self.
	elements add: anElement
]

{ #category : #adding }
OKDummyModularModelObject >> addedTo: anObject [
	owner := anObject
]

{ #category : #announce }
OKDummyModularModelObject >> announce: anObject [
	announcements add: anObject
]

{ #category : #announce }
OKDummyModularModelObject >> countAnnouncement: aClass [
	^ announcements count: [ :each | each isKindOf: aClass ]
]

{ #category : #initialization }
OKDummyModularModelObject >> initialize [
	super initialize.
	elements := OrderedCollection new.
	name := ''.
	self resetFlags
]

{ #category : #accessing }
OKDummyModularModelObject >> name [
	^ name
]

{ #category : #accessing }
OKDummyModularModelObject >> name: aString [
	name := aString
]

{ #category : #accessing }
OKDummyModularModelObject >> ownedElements [
	^ elements
]

{ #category : #accessing }
OKDummyModularModelObject >> owner [
	^ owner
]

{ #category : #accessing }
OKDummyModularModelObject >> relatedElements [
	^ {}
]

{ #category : #initialization }
OKDummyModularModelObject >> resetFlags [
	announcements := OrderedCollection new
]
