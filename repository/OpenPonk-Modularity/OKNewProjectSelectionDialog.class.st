"
I am a dialog for selection kind of project to create.
"
Class {
	#name : #OKNewProjectSelectionDialog,
	#superclass : #OKSelectionDialog,
	#category : 'OpenPonk-Modularity-Spec'
}

{ #category : #'instance creation' }
OKNewProjectSelectionDialog class >> openForProjectClasses: projectClasses [
	^ self new
		projectClasses: projectClasses;
		openWithSpec
]

{ #category : #protected }
OKNewProjectSelectionDialog >> listNameFor: anItem [
	^ anItem name
]

{ #category : #accessing }
OKNewProjectSelectionDialog >> projectClasses: projectClasses [
	self items: projectClasses
]

{ #category : #accessing }
OKNewProjectSelectionDialog >> selected: aProjectClass [
	^ OKWorkbenchToolbar newProject: aProjectClass
]

{ #category : #api }
OKNewProjectSelectionDialog >> title [
	^ 'Select a kind of project'
]
