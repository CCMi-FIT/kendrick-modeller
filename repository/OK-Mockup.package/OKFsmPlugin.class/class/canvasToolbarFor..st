as yet unclassified
canvasToolbarFor: aBuilder
	<dcCanvasToolbar: #OKFsmPlugin>
	(aBuilder item: 'Layout')
		action: [ OPLayoutWizard new
				controller: aBuilder model diagramController;
				open ]