Class {
	#name : #OKDummyProject,
	#superclass : #Object,
	#instVars : [
		'models'
	],
	#category : #'Kendrick-Modeller-Core-Tests'
}

{ #category : #accessing }
OKDummyProject >> definitionModels [
	^ self models
]

{ #category : #accessing }
OKDummyProject >> models [
	^ models
		ifNil: [ | x y |
			x := OKDummyModel named: 'X'.
			y := OKDummyModel named: 'Y'.
			y dependsOnModelNamed: 'X-e2-r2'.
			models := {x. y} ]
]
