hooks
selectPossibleElementsFromModules
	| existingLinks includedElements |
	includedElements := self model modules
		flatCollect: [ :eachModule | eachModule linkedElements ].
	existingLinks := self model links collect: #linkedModel.
	^ (includedElements difference: existingLinks) asOrderedCollection