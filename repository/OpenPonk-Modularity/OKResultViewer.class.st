"
I am an subclass of OKEditor that is used for resulting diagrams that cannot be changed.
"
Class {
	#name : #OKResultViewer,
	#superclass : #OKEditor,
	#category : 'OpenPonk-Modularity-Spec'
}

{ #category : #specs }
OKResultViewer class >> defaultSpec [
	^ SpecColumnLayout composed
		add: #canvasModel;
		addSplitter;
		newRow: [ :r | 
			r
				add: #canvasMenuModel;
				add: #zoomLabel width: 35 ]
			height: self toolbarHeight - 1;
		yourself
]

{ #category : #adding }
OKResultViewer >> addToProjectController [
	self workbench projectController addResultDiagramController: diagramController
]

{ #category : #testing }
OKResultViewer >> isViewOnly [
	^ true
]
