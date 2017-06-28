hooks
selectPossibleElementsFromModules
	"return all linkable elements that are present in linked modules, but are not linked already"
	
	| existingLinks includedElements |
	includedElements := (self model moduleLinks
		flatCollect: [ :eachModule | eachModule linkedElements ])
		select: [ :each | each canBeValidLinkedTo ].
	existingLinks := self model links collect: #linkedModel.
	^ (includedElements difference: existingLinks) asOrderedCollection