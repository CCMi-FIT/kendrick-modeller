Class {
	#name : #OKDummyElement,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Kendrick-Modeller-Core-Tests'
}

{ #category : #'instance creation' }
OKDummyElement class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #testing }
OKDummyElement >> canBeLinkedTo [
	^ true
]

{ #category : #testing }
OKDummyElement >> canBeValidLinkedTo [
	^ name isNotEmpty
]

{ #category : #testing }
OKDummyElement >> isLink [
	^ false
]

{ #category : #'instance creation' }
OKDummyElement >> name [
	^ name
]

{ #category : #'instance creation' }
OKDummyElement >> name: aString [
	name := aString
]

{ #category : #accessing }
OKDummyElement >> originalModelObject [
	^ self
]

{ #category : #printing }
OKDummyElement >> printOn: aStream [
	super printOn: aStream.
	aStream << ' (''' << self name << ''')'
]

{ #category : #'announcement registration' }
OKDummyElement >> whenChanged: something [
	"do nothing"

	
]
