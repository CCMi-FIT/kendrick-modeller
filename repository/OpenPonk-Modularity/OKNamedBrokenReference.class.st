"
I can be linked to if there is a link to an invalid element or model. You can set and see my name, but there is not much you can do with me in comparison with real model elements.

I am, in many cases, just a dummy object that can never be added to any container or used as anything else than for linking to me.
"
Class {
	#name : #OKNamedBrokenReference,
	#superclass : #OPModelObject,
	#category : 'OpenPonk-Modularity-Models'
}

{ #category : #adding }
OKNamedBrokenReference >> add: anElement [
	self shouldNotImplement
]

{ #category : #adding }
OKNamedBrokenReference >> addAll: aCollection [
	self shouldNotImplement
]

{ #category : #announcing }
OKNamedBrokenReference >> announce: anAnnouncement [
	"do nothing"

	
]

{ #category : #announcing }
OKNamedBrokenReference >> announceAdded: anElement [
	"do nothing"

	
]

{ #category : #announcing }
OKNamedBrokenReference >> announceChanged: anElement [
	"do nothing"

	
]

{ #category : #announcing }
OKNamedBrokenReference >> announceRemoved: anElement [
	"do nothing"

	
]

{ #category : #testing }
OKNamedBrokenReference >> canBeLinkedTo [
	"is it even possible to create a link to me?"
	
	^ true
]

{ #category : #testing }
OKNamedBrokenReference >> canBeValidLinkedTo [
	"if a link is created to point to me, should the link be considered valid?"
	
	^ false
]

{ #category : #announcing }
OKNamedBrokenReference >> changed [
	"do nothing"

	
]

{ #category : #removing }
OKNamedBrokenReference >> remove: anElement [
	self shouldNotImplement
]

{ #category : #removing }
OKNamedBrokenReference >> removeAll [
	self shouldNotImplement
]

{ #category : #removing }
OKNamedBrokenReference >> removeOwnedElements [
	"do nothing"
]

{ #category : #removing }
OKNamedBrokenReference >> removeRelatedElements [
	"do nothing"
]
