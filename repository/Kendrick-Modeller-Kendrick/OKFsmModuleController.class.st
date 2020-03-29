Class {
	#name : #OKFsmModuleController,
	#superclass : #OKModuleLinkController,
	#category : #'Kendrick-Modeller-Kendrick-Controllers'
}

{ #category : #accessing }
OKFsmModuleController >> modelClass [
	^ OKFsmModuleLink
]

{ #category : #figures }
OKFsmModuleController >> moduleIndex [
	| modules index |
	modules := self diagramController model moduleLinks.
	index := ((modules select: [ :each | each class = self modelClass ])
		asSortedCollection: [ :a :b | a name < b name ]) indexOf: self model.
	index isZero
		ifFalse: [ ^ index ].
	^ modules size + 1
]
