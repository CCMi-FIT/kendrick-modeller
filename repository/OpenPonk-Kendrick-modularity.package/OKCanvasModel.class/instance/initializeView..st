initialization
initializeView: aView
	| menu |
	super initializeView: aView.
	menu := PluggableMenuSpec new model: aView.
	menu
		add: 'Inspect Model'
			action: (MessageSend receiver: [ self editor diagramController model inspect ] selector: #value);
		add: 'Inspect Controller'
			action: (MessageSend receiver: [ self editor diagramController inspect ] selector: #value).
	aView when: TRMouseRightClick do: [ :event | menu asMenuMorph popUpInWorld ].
	^ aView