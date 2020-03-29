"
I am any attribute or compartment in kendrick models or concerns.
"
Class {
	#name : #OKFsmState,
	#superclass : #OPFsmVertex,
	#traits : 'OKTModularModelObject',
	#classTraits : 'OKTModularModelObject classTrait',
	#category : #'Kendrick-Modeller-Kendrick-Models'
}

{ #category : #'instance creation' }
OKFsmState class >> basedOn: attributeType name: aString [
	^ (self classFor: attributeType name: aString) new
]

{ #category : #hooks }
OKFsmState class >> classFor: attributeType name: aString [
	^ self allSubclasses detect: [ :any | any suitableForType: attributeType name: aString ]
]

{ #category : #'OpenPonk-FSM-GraphML-accessing' }
OKFsmState class >> graphmlType [
	^ self subclassResponsibility
]

{ #category : #hooks }
OKFsmState class >> kendrickAttributeType [
	^ self graphmlType
]

{ #category : #'instance creation' }
OKFsmState class >> named: aString basedOn: attributeType [
	^ (self basedOn: attributeType name: aString)
		name: aString;
		yourself
]

{ #category : #hooks }
OKFsmState class >> suitableForType: attributeType name: aString [
	^ self kendrickAttributeType = attributeType
]

{ #category : #associating }
OKFsmState >> -> aVertex [
	^ OKFsmTransition from: self to: aVertex
]

{ #category : #accessing }
OKFsmState >> asCompartmentDictionary [
	^ {(self kendrickAttributeType -> self name asSymbol)} asDictionary
]

{ #category : #'OpenPonk-FSM-GraphML-accessing' }
OKFsmState >> graphmlType [
	^ self class graphmlType
]

{ #category : #testing }
OKFsmState >> hasEditableName [
	^ true
]

{ #category : #hooks }
OKFsmState >> kendrickAttributeType [
	^ self class kendrickAttributeType
]

{ #category : #removing }
OKFsmState >> removedFrom: anOwner [
	self removedFrom: anOwner do: [  ]
]
