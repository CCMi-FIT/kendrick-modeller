adding
addModel: aModel
	(Smalltalk hasClassNamed: #MooseEntityAnnouncement)
		ifTrue: [ aModel when: #MooseEntityAnnouncement asClass do: [ :event | self beDirty ] ].
	aModel
		when: OPElementChanged
			do: [ :event | 
			self
				beDirty;
				updateResultsForChangeOf: event element in: aModel ];
		when: OPElementAdded
			do: [ :event | 
			self
				beDirty;
				updateResultsForAdded: event element in: aModel ];
		when: OPElementRemoved
			do: [ :event | 
			self
				beDirty;
				updateResultsForRemoved: event element in: aModel ].
	models add: aModel.
	(aModel respondsTo: #project:)
		ifTrue: [ aModel project: self ].
	resultModels at: aModel put: OrderedCollection new.
	self updateResultsForAdded: aModel