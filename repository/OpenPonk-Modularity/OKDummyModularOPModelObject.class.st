Class {
	#name : #OKDummyModularOPModelObject,
	#superclass : #OPModelObject,
	#traits : 'OKTModularModelObject',
	#classTraits : 'OKTModularModelObject classTrait',
	#instVars : [
		'receivedLinkRenamed',
		'announcements'
	],
	#category : 'OpenPonk-Modularity-Tests'
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
