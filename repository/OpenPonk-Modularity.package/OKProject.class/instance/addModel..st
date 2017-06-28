adding
addModel: aModel
	aModel
		when: OPElementChanged
			do: [ :event | 
			(event isKindOf: OKElementChangedDuplicite)
				ifFalse: [ self updateResultsForChangeOf: event element in: aModel ] ];
		when: OPElementAdded
			do: [ :event | self updateResultsForAdded: event element in: aModel ];
		when: OPElementRemoved
			do: [ :event | self updateResultsForRemoved: event element in: aModel ];
		when: OKLinkRenamed
			do: [ :event | self renamedLinkIn: aModel ].
	super addModel: aModel.
	self updateResultsForAdded: aModel