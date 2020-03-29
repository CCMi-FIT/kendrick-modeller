"
I am a Kendrick empty status. I cannot be renamed.
"
Class {
	#name : #OKFsmEmptyStatus,
	#superclass : #OKFsmStatus,
	#category : #'Kendrick-Modeller-Kendrick-Models'
}

{ #category : #'OpenPonk-FSM-GraphML-accessing' }
OKFsmEmptyStatus class >> graphmlType [
	^ #empty
]

{ #category : #hooks }
OKFsmEmptyStatus class >> kendrickAttributeType [
	^ super graphmlType
]

{ #category : #hooks }
OKFsmEmptyStatus class >> suitableForType: attributeType name: aString [
	^ self kendrickAttributeType = attributeType and: [ aString asSymbol = #empty ]
]

{ #category : #testing }
OKFsmEmptyStatus >> hasEditableName [
	^ false
]

{ #category : #accessing }
OKFsmEmptyStatus >> name [
	^ 'empty'
]

{ #category : #accessing }
OKFsmEmptyStatus >> name: aString [
	"do nothing"
]

{ #category : #printing }
OKFsmEmptyStatus >> printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."

	| title |
	title := self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title
]
