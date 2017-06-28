private
updateElementLinksIn: aDefinitionModel
	"element links are updated to point to current elements in linked resulting models (not all elements in all models, just linked resulting models)"

	| setOfTransformedElements resultElementsToLink |
	setOfTransformedElements := (aDefinitionModel moduleLinks
		flatCollectAsSet: [ :each | each linkedModel elements ])
		select: [ :each | each canBeLinkedTo ].
	resultElementsToLink := (aDefinitionModel elementAndEdgeLinks
		reject: [ :eachLink | setOfTransformedElements includes: eachLink linkedModel ]
		thenCollect: [ :eachLink | 
			eachLink
				->
					(setOfTransformedElements
						detect: [ :any | eachLink canRelinkTo: any ]
						ifNone: [ OKNamedBrokenReference named: eachLink name ]) ]) asDictionary.
	resultElementsToLink
		keysAndValuesDo: [ :link :newElement | link linkedModel: newElement ]