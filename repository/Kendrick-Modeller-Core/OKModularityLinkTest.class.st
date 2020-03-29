Class {
	#name : #OKModularityLinkTest,
	#superclass : #TestCase,
	#instVars : [
		'link'
	],
	#category : #'Kendrick-Modeller-Core-Tests'
}

{ #category : #running }
OKModularityLinkTest >> setUp [
	link := OKModuleElementLink new.
]

{ #category : #tests }
OKModularityLinkTest >> testCanBeLinkedTo [
	self assert: link canBeLinkedTo
]

{ #category : #tests }
OKModularityLinkTest >> testCanBeValidLinkedTo [
	self deny: link canBeValidLinkedTo.
	link linkedModel: (OKDummyElement named: 'x').
	self assert: link canBeValidLinkedTo.
	link linkedModel: (OKDummyElement named: '').
	self deny: link canBeValidLinkedTo.
	link linkedModel: (OKDummyElement named: 'x').
	self assert: link canBeValidLinkedTo.
	link linkedModel: (OKNamedBrokenReference named: 'x').
	self deny: link canBeValidLinkedTo
]

{ #category : #tests }
OKModularityLinkTest >> testIsValid [
	self deny: link isValid.
	link linkedModel: (OKDummyElement named: 'x').
	self assert: link isValid.
	link linkedModel: (OKDummyElement named: '').
	self deny: link isValid.
	link linkedModel: (OKDummyElement named: 'x').
	self assert: link isValid.
	link linkedModel: (OKNamedBrokenReference named: 'x').
	self deny: link isValid
]

{ #category : #tests }
OKModularityLinkTest >> testOriginalModelObject [
	| obj |
	obj := OKDummyElement named: 'x'.
	link linkedModel: obj.
	self assert: (link originalModelObject == obj)
]
