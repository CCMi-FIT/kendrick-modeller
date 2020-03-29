"
I am an abstract class - element representing another diagram or element from another diagram. Look at my subclasses for more info.
"
Class {
	#name : #OKModularityLink,
	#superclass : #OPNamedElement,
	#traits : 'OKTModularModelObject',
	#classTraits : 'OKTModularModelObject classTrait',
	#instVars : [
		'linkedModel'
	],
	#category : #'Kendrick-Modeller-Core-Models'
}

{ #category : #accessing }
OKModularityLink class >> linkedModel: aModel [
	^ self new
		linkedModel: aModel;
		yourself
]

{ #category : #accessing }
OKModularityLink class >> toName: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #testing }
OKModularityLink >> canBeLinkedTo [
	"is it even possible to create a link to me?"
	
	^ true
]

{ #category : #testing }
OKModularityLink >> canBeValidLinkedTo [
	"if a link is created to point to me, should the link be considered valid?"
	
	^ self isValid
]

{ #category : #testing }
OKModularityLink >> canRelinkTo: aModelObject [
	"can I point to aModelObject from now on?"
	
	^ aModelObject canBeLinkedTo
		and: [ aModelObject name = linkedModel name ]
]

{ #category : #testing }
OKModularityLink >> isLink [
	^ true
]

{ #category : #testing }
OKModularityLink >> isValid [
	"do I point to an model object that can be validly linked to? if not, no result should be produces out of a model I am part of"

	^ linkedModel isNotNil and: [ linkedModel canBeValidLinkedTo ]
]

{ #category : #accessing }
OKModularityLink >> linkedElements [
	"elements in linked model"

	^ linkedModel elements
]

{ #category : #accessing }
OKModularityLink >> linkedModel [
	^ linkedModel
]

{ #category : #accessing }
OKModularityLink >> linkedModel: aModel [
	linkedModel := aModel.
	linkedModel whenChanged: [ self changed ]
]

{ #category : #accessing }
OKModularityLink >> name [
	"name of linked model object (or broken reference)"

	^ self linkedModel name
]

{ #category : #accessing }
OKModularityLink >> name: aString [
	"this is, in fact, not renaming of the link, but pointing to an element with given name"

	self
		linkedModel: (OKNamedBrokenReference named: aString);
		linkRenamed
]

{ #category : #accessing }
OKModularityLink >> originalModelObject [
	"links answer linked object ... other kinds of model objects answer self"

	^ linkedModel originalModelObject
]

{ #category : #printing }
OKModularityLink >> printOn: aStream [
	super printOn: aStream.
	self isValid
		ifFalse: [ aStream nextPutAll: '(invalid)' ]
]
