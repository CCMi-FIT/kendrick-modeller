Extension { #name : #OPCanvasModel }

{ #category : #'*Kendrick-Modeller-Core-Spec' }
OPCanvasModel >> addMenuFor: aFigure [
	| menu |
	menu := PluggableMenuSpec new model: aFigure.
	self diagramController editor isViewOnly
		ifFalse: [ menu
				add: 'Delete'
				action: (MessageSend receiver: self selector: #deleteFigure: argument: aFigure) ].
	menu
		add: 'Inspect Model'
			action:
			(MessageSend
				receiver: self
				selector: #inspectFigureModel:
				argument: aFigure);
		add: 'Inspect Figure'
			action: (MessageSend receiver: self selector: #inspectFigure: argument: aFigure).
	self diagramController editor isViewOnly
		ifFalse: [ menu
				add: 'Rename'
				action: (MessageSend receiver: self selector: #renameFigure: argument: aFigure) ].
	aFigure
		when: TRMouseRightClick
		do: [ :event | menu asMenuMorph popUpInWorld ]
]

{ #category : #'*Kendrick-Modeller-Core-Spec' }
OPCanvasModel >> initializeView: aView [
	| menu |
	aView when: TRMouseLeftClick do: [ :event | self viewClicked: event ].
	aView @ RTDraggableView.
	aView @ (RTZoomableView new min: 0.25 max: 4).
	aView @ (RTGridView new gridSize: 20).
	menu := PluggableMenuSpec new model: aView.
	menu
		add: 'Inspect Model'
			action: (MessageSend receiver: [ self editor diagramController model inspect ] selector: #value);
		add: 'Inspect Controller'
			action: (MessageSend receiver: [ self editor diagramController inspect ] selector: #value).
	aView when: TRMouseRightClick do: [ :event | menu asMenuMorph popUpInWorld ].
	^ aView canvas camera
		addCallback:
			(TRCameraScaleCallback
				block: [ :newScale | 
					self editor zoomLabel
						label:
							(newScale < 1
								ifTrue: [ '   ' ]
								ifFalse: [ '' ]) , (newScale * 100) rounded asString , '%' ])
]
