private
updateLinksIn: anOpenPonkDiagram thenAnnounce: requestedAnnounce
	| setOfTransformedDiagrams resultDiagramsToLink setOfTransformedElements resultElementsToLink |
	setOfTransformedDiagrams := (transformedModels
		flatCollectAsSet: [ :eachTransformedSet | eachTransformedSet ])
		select: [ :each | each canBeValidLinkedTo ].
	resultDiagramsToLink := (anOpenPonkDiagram modules
		reject: [ :eachLink | setOfTransformedDiagrams includes: eachLink linkedModel ]
		thenCollect: [ :eachLink | 
			eachLink
				->
					(setOfTransformedDiagrams
						detect: [ :any | eachLink canRelinkTo: any ]
						ifNone: [ OKNamedBrokenReference named: eachLink name ]) ]) asDictionary.
	resultDiagramsToLink
		keysAndValuesDo: [ :module :newDiagram | module linkedModel: newDiagram ].
	setOfTransformedElements := (anOpenPonkDiagram modules
		flatCollectAsSet: [ :each | each linkedModel elements ])
		select: [ :each | each canBeLinkedTo ].
	resultElementsToLink := (anOpenPonkDiagram elementLinksWithoutEdges
		reject: [ :eachLink | setOfTransformedElements includes: eachLink linkedModel ]
		thenCollect: [ :eachLink | 
			eachLink
				->
					(setOfTransformedElements
						detect: [ :any | eachLink canRelinkTo: any ]
						ifNone: [ OKNamedBrokenReference named: eachLink name ]) ]) asDictionary.
	resultElementsToLink
		keysAndValuesDo: [ :link :newElement | link linkedModel: newElement ].
	(requestedAnnounce or: [ anOpenPonkDiagram links allSatisfy: [ :each | each isValid ] ])
		ifTrue: [ anOpenPonkDiagram linksUpdated ]