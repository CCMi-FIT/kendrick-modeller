"
I am an subclass of OPEditor that complies with differences of UI between OpenPonk and this modularity tool.
"
Class {
	#name : #OKEditor,
	#superclass : #OPEditor,
	#category : #'Kendrick-Modeller-Core-Spec'
}

{ #category : #adding }
OKEditor >> addToProjectController [
	self workbench projectController addDiagramController: diagramController
]

{ #category : #initialization }
OKEditor >> initializeWidgets [
	canvasMenuModel := self instantiate: MenuModel.
	canvasModel := self instantiate: OPCanvasModel.
	paletteModel := self instantiate: OPPalette.
	(zoomLabel := self newLabel) label: '100%'.
	self focusOrder
		add: canvasMenuModel;
		add: canvasModel;
		add: paletteModel
]

{ #category : #testing }
OKEditor >> isViewOnly [
	^ false
]

{ #category : #'diagram handling' }
OKEditor >> openModel: aModel [
	diagramController := self newDiagramControllerFor: aModel.
	self addToProjectController.
	canvasModel attachController: diagramController.
	canvasMenuModel
		fromSpec: (OPPragmaPluginMenuBuilder pragmaKeyword: #opCanvasToolbar: model: canvasModel) menuSpec.
	self rebuildWidget.
	canvasModel reloadView.
	self applyLayoutFor: aModel.
	diagramController saveState
]
