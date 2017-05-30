hooks
selectPossibleElementsFromModules
	| existingLinks includedElements |
	includedElements := (self model modules
		flatCollect: [ :eachModule | eachModule linkedElements ])
		select: [ :each | each canBeValidLinkedTo ].
	existingLinks := self model links collect: #linkedModel.
	^ (includedElements difference: existingLinks) asOrderedCollection