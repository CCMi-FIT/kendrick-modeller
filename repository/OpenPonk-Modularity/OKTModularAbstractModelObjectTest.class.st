Class {
	#name : #OKTModularAbstractModelObjectTest,
	#superclass : #TestCase,
	#instVars : [
		'object'
	],
	#category : 'OpenPonk-Modularity-Tests'
}

{ #category : #testing }
OKTModularAbstractModelObjectTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #OKTModularAbstractModelObjectTest
			
]

{ #category : #'instance creation' }
OKTModularAbstractModelObjectTest >> newObject [
	^ self subclassResponsibility
]

{ #category : #running }
OKTModularAbstractModelObjectTest >> setUp [
	object := self newObject
]

{ #category : #tests }
OKTModularAbstractModelObjectTest >> testCanBeValidLinkedTo [
	object name: ''.
	self deny: object canBeValidLinkedTo.
	object name: 'test'.
	self assert: object canBeValidLinkedTo
]

{ #category : #tests }
OKTModularAbstractModelObjectTest >> testDependingElements [
	| innerObject outerObject |
	innerObject := self newObject.
	outerObject := OKDummyModularDiagram new.
	self assert: innerObject dependingElements size equals: 0.
	self assert: object dependingElements size equals: 0.
	self assert: outerObject dependingElements size equals: 0.
	outerObject add: object.
	object add: innerObject.
	self assert: innerObject dependingElements size equals: 0.
	self assert: object dependingElements size equals: 1.
	self assert: (object dependingElements includes: innerObject).
	self assert: outerObject dependingElements size equals: 1.
	self assert: (outerObject dependingElements includes: object).
]

{ #category : #tests }
OKTModularAbstractModelObjectTest >> testDependingOnElements [
	| innerObject outerObject |
	innerObject := self newObject.
	outerObject := OKDummyModularDiagram new.
	self assert: innerObject dependingOnElements size equals: 0.
	self assert: object dependingOnElements size equals: 0.
	self assert: outerObject dependingOnElements size equals: 0.
	outerObject add: object.
	object add: innerObject.
	self assert: innerObject dependingOnElements size equals: 1.
	self assert: (innerObject dependingOnElements includes: object).
	self assert: object dependingOnElements size equals: 1.
	self assert: (object dependingOnElements includes: outerObject).
	self assert: outerObject dependingOnElements size equals: 0
]

{ #category : #tests }
OKTModularAbstractModelObjectTest >> testForwardingLinkRenamed [
	| innerObject outerObject |
	innerObject := self newObject.
	outerObject := OKDummyModularDiagram new.
	outerObject add: object.
	object add: innerObject.
	self deny: (outerObject countAnnouncement: OKLinkRenamed) > 0.
	innerObject linkRenamed.
	self assert: (outerObject countAnnouncement: OKLinkRenamed) > 0
]

{ #category : #tests }
OKTModularAbstractModelObjectTest >> testIsLink [
	self deny: object isLink
]

{ #category : #tests }
OKTModularAbstractModelObjectTest >> testOriginalModelObject [
	self assert: object originalModelObject equals: object
]
