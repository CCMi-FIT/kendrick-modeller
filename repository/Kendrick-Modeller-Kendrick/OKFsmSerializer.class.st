Class {
	#name : #OKFsmSerializer,
	#superclass : #OPFsmSerializer,
	#category : #'Kendrick-Modeller-Kendrick-Serialization'
}

{ #category : #'serialize/materialize' }
OKFsmSerializer >> graphmlClass [
	^ self subclassResponsibility
]

{ #category : #'serialize/materialize' }
OKFsmSerializer >> materializeModelFrom: aString [
	^ self graphmlClass new import: aString
]

{ #category : #'serialize/materialize' }
OKFsmSerializer >> serializeModel: aModel [
	^ self graphmlClass new export: aModel
]
