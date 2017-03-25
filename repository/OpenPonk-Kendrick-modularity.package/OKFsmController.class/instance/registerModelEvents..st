events - registering
registerModelEvents: aDiagramModel
	super registerModelEvents: aDiagramModel.
	aDiagramModel
		when: OPElementAdded
		do: [ :event | 
			(self includesModel: event element)
				ifFalse: [ self addModelElement: event element ] ]