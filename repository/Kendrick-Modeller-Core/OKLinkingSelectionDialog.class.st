"
I am a dialog which allows the user to select model objects from given collection.
"
Class {
	#name : #OKLinkingSelectionDialog,
	#superclass : #OKSelectionDialog,
	#instVars : [
		'workbench',
		'diagramController'
	],
	#category : #'Kendrick-Modeller-Core-Spec'
}

{ #category : #'instance creation' }
OKLinkingSelectionDialog class >> openForPalette: aPalette [
	aPalette deselectTool.
	^ self openForWorkbench: aPalette workbench diagramController: aPalette diagramController
]

{ #category : #'instance creation' }
OKLinkingSelectionDialog class >> openForWorkbench: aWorkbench diagramController: aDiagramController [
	^ self new
		workbench: aWorkbench diagramController: aDiagramController;
		openWithSpec
]

{ #category : #accessing }
OKLinkingSelectionDialog >> diagram [
	^ diagramController model
]

{ #category : #accessing }
OKLinkingSelectionDialog >> diagramController [
	^ diagramController
]

{ #category : #accessing }
OKLinkingSelectionDialog >> models [
	^ self subclassResponsibility
]

{ #category : #accessing }
OKLinkingSelectionDialog >> project [
	^ workbench projectController project
]

{ #category : #accessing }
OKLinkingSelectionDialog >> workbench [
	^ workbench
]

{ #category : #accessing }
OKLinkingSelectionDialog >> workbench: aWorkbench diagramController: aDiagramController [
	workbench := aWorkbench.
	diagramController := aDiagramController.
	self items: self models
]
