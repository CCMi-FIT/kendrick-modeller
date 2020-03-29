Class {
	#name : #OKDummyModularOPModelObject,
	#superclass : #OPModelObject,
	#traits : 'OKTModularModelObject',
	#classTraits : 'OKTModularModelObject classTrait',
	#instVars : [
		'receivedLinkRenamed',
		'announcements'
	],
	#category : #'Kendrick-Modeller-Core-Tests'
}

{ #category : #announcing }
OKDummyModularOPModelObject >> announce: anObject [
	announcements add: anObject
]

{ #category : #initialization }
OKDummyModularOPModelObject >> initialize [
	super initialize.
	self resetFlags
]

{ #category : #initialization }
OKDummyModularOPModelObject >> resetFlags [
	announcements := OrderedCollection new
]
