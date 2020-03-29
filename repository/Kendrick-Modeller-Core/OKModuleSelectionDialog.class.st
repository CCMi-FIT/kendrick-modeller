"
I am a dialog which allows the user to select diagrams from given collection.
"
Class {
	#name : #OKModuleSelectionDialog,
	#superclass : #OKLinkingSelectionDialog,
	#category : #'Kendrick-Modeller-Core-Spec'
}

{ #category : #accessing }
OKModuleSelectionDialog >> models [
	^ diagramController selectPossibleModules
]

{ #category : #accessing }
OKModuleSelectionDialog >> selected: aModel [
	diagramController link: aModel
]

{ #category : #api }
OKModuleSelectionDialog >> title [
	^ 'Select a module'
]
