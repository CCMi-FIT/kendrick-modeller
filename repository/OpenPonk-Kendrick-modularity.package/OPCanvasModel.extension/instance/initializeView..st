*OpenPonk-Kendrick-modularity-Spec
initializeView: aView
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