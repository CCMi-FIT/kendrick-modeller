adding
addModel: aModel
	(Smalltalk hasClassNamed: #MooseEntityAnnouncement)
		ifTrue: [ aModel
				when:
					(self class environment at: #MooseEntityAnnouncement)
				do: [ :event | self beDirty ] ].
	aModel
		when: OPElementChanged
			do: [ :event | 
			self beDirty.
			(event isKindOf: OKElementChangedDuplicite)
				ifFalse: [ self updateResultsForChangeOf: event element in: aModel ] ];
		when: OPElementAdded
			do: [ :event | 
			self
				beDirty;
				updateResultsForAdded: event element in: aModel ];
		when: OPElementRemoved
			do: [ :event | 
			self
				beDirty;
				updateResultsForRemoved: event element in: aModel ];
		when: OKLinkRenamed
			do: [ :event | self updateLinksAfterRenamingIn: aModel ].
	models add: aModel.
	(aModel respondsTo: #project:)
		ifTrue: [ aModel project: self ].
	self updateResultsForAdded: aModel