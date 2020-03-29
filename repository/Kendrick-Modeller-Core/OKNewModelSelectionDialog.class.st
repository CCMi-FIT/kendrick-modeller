"
I am a dialog for selection kind of model to create.
"
Class {
	#name : #OKNewModelSelectionDialog,
	#superclass : #OKSelectionDialog,
	#instVars : [
		'projectController'
	],
	#category : #'Kendrick-Modeller-Core-Spec'
}

{ #category : #'instance creation' }
OKNewModelSelectionDialog class >> openForProjectController: aProjectController [
	^ self new
		projectController: aProjectController;
		openWithSpec
]

{ #category : #accessing }
OKNewModelSelectionDialog >> enabledPlugins [
	^ (projectController ifNil: [ {} ] ifNotNil: [ self project enabledPlugins ])
		asOrderedCollection
]

{ #category : #protected }
OKNewModelSelectionDialog >> listNameFor: anItem [
	^ anItem name
]

{ #category : #accessing }
OKNewModelSelectionDialog >> project [
	^ projectController project
]

{ #category : #accessing }
OKNewModelSelectionDialog >> projectController [
	^ projectController
]

{ #category : #accessing }
OKNewModelSelectionDialog >> projectController: aProjectController [
	projectController := aProjectController.
	self items: self enabledPlugins
]

{ #category : #accessing }
OKNewModelSelectionDialog >> selected: aPlugin [
	^ (UIManager default request: 'Model name' initialAnswer: aPlugin name)
		ifNotNil: [ :filledName | 
			| aDiagram |
			aDiagram := aPlugin modelClass named: filledName.
			self project addModel: aDiagram.
			self projectController openAllDiagrams ]
]

{ #category : #api }
OKNewModelSelectionDialog >> title [
	^ 'Select a kind of new model'
]
