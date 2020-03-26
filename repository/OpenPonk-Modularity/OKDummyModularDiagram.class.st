Class {
	#name : #OKDummyModularDiagram,
	#superclass : #OKDummyModularModelObject,
	#traits : 'OKTModularDiagram',
	#classTraits : 'OKTModularDiagram classTrait',
	#category : 'OpenPonk-Modularity-Tests'
}

{ #category : #initialization }
OKDummyModularDiagram >> initialize [
	super initialize.
	self resetFlags
]
