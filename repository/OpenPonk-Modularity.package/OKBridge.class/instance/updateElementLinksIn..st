private
updateElementLinksIn: anOpenPonkDiagram
	"element links are updated to point to current elements in linked resulting models (not all elements in all models, just linked resulting models)"

	| setOfTransformedElements resultElementsToLink |
	setOfTransformedElements := (anOpenPonkDiagram modules
		flatCollectAsSet: [ :each | each linkedModel elements ])
		select: [ :each | each canBeLinkedTo ].
	resultElementsToLink := (anOpenPonkDiagram elementAndEdgeLinks
		reject: [ :eachLink | setOfTransformedElements includes: eachLink linkedModel ]
		thenCollect: [ :eachLink | 
			eachLink
				->
					(setOfTransformedElements
						detect: [ :any | eachLink canRelinkTo: any ]
						ifNone: [ OKNamedBrokenReference named: eachLink name ]) ]) asDictionary.
	resultElementsToLink keysAndValuesDo: [ :link :newElement | link linkedModel: newElement ]