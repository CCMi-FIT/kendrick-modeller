Class {
	#name : #OKDummyModularDiagram,
	#superclass : #OKDummyModularModelObject,
	#traits : 'OKTModularDiagram',
	#classTraits : 'OKTModularDiagram classTrait',
	#category : #'Kendrick-Modeller-Core-Tests'
}

{ #category : #initialization }
OKDummyModularDiagram >> initialize [
	super initialize.
	self resetFlags
]
