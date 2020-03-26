"
I am a dialog which allows the user to select elements from given collection.
"
Class {
	#name : #OKModuleElementSelectionDialog,
	#superclass : #OKLinkingSelectionDialog,
	#category : 'OpenPonk-Modularity-Spec'
}

{ #category : #accessing }
OKModuleElementSelectionDialog >> models [
	^ diagramController selectPossibleElementsFromModules
]

{ #category : #accessing }
OKModuleElementSelectionDialog >> selected: aModel [
	diagramController
		linkRecursively: aModel;
		applyDefaultLayout
]

{ #category : #api }
OKModuleElementSelectionDialog >> title [
	^ 'Select an element from added modules'
]
