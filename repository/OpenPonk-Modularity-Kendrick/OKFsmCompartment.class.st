"
I am a cartesian product of attributes. For example, I can be a combination of state 'X' and species 'A'. In that case, I will be equal to Kendrick compartment #state->'X'. #species->'A'.
"
Class {
	#name : #OKFsmCompartment,
	#superclass : #OKFsmState,
	#instVars : [
		'parts'
	],
	#category : 'OpenPonk-Modularity-Kendrick-Models'
}

{ #category : #'OpenPonk-FSM-GraphML-accessing' }
OKFsmCompartment class >> graphmlType [
	^ #compartment
]

{ #category : #'instance creation' }
OKFsmCompartment class >> parts: aCollection [
	^ self new
		parts: aCollection;
		yourself
]

{ #category : #hooks }
OKFsmCompartment class >> suitableForType: attributeType name: aString [
	^ false
]

{ #category : #adding }
OKFsmCompartment >> addPart: aModelElement [
	"I can have a part of each type. For example, one part should be a Status and second one a Species."

	parts add: aModelElement
]

{ #category : #accessing }
OKFsmCompartment >> asCompartmentDictionary [
	"I will return Kendrick-friendly dictionary of my parts. If I was combined as state 'X' and specie 'A', I will return dictionary {#state->'X'. #species->'A'} asDictionary."

	^ Dictionary new , (parts collect: [ :each | each asCompartmentDictionary ])
]

{ #category : #testing }
OKFsmCompartment >> hasEditableName [
	^ false
]

{ #category : #initialization }
OKFsmCompartment >> initialize [
	super initialize.
	parts := OrderedCollection new
]

{ #category : #accessing }
OKFsmCompartment >> name [
	^ String
		streamContents: [ :stream | (parts collect: [ :each | each name ]) asStringOn: stream delimiter: '--' ]
]

{ #category : #accessing }
OKFsmCompartment >> name: aString [
	"do nothing"

	
]

{ #category : #accessing }
OKFsmCompartment >> parts [
	^ parts
]

{ #category : #accessing }
OKFsmCompartment >> parts: anOrderedCollection [
	parts := anOrderedCollection
]
