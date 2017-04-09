hooks
selectPossibleElementsFromModules
	| existingLinks includedElements |
	includedElements := self model modules flatCollect: [ :eachModule | eachModule elements ].
	existingLinks := self model links collect: #linkedModel.
	^ (includedElements difference: existingLinks) asOrderedCollection