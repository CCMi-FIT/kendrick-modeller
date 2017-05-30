private
updateLinksIn: anOpenPonkDiagram
	| setOfTransformedDiagrams resultDiagramsToLink setOfTransformedElements resultElementsToLink |
	setOfTransformedDiagrams := (transformedModels
		flatCollectAsSet: [ :eachTransformedSet | eachTransformedSet ])
		select: [ :each | each canBeValidLinkedTo ].
	resultDiagramsToLink := anOpenPonkDiagram modules
		reject: [ :eachLink | setOfTransformedDiagrams includes: eachLink linkedModel ]
		thenCollect: [ :eachLink | 
			eachLink
				->
					(setOfTransformedDiagrams
						detect: [ :any | eachLink canRelinkTo: any ]
						ifNone: [ OKModelObjectReference named: eachLink name ]) ].
	resultDiagramsToLink ifEmpty: [ ^ self ].
	resultDiagramsToLink
		keysAndValuesDo: [ :module :newDiagram | module linkedModel: newDiagram ].
	setOfTransformedElements := (resultDiagramsToLink select: [ :each | each isValid ])
		flatCollectAsSet: [ :each | each elements ].
	resultElementsToLink := anOpenPonkDiagram elementLinks
		reject: [ :eachLink | setOfTransformedElements includes: eachLink linkedModel ]
		thenCollect: [ :eachLink | 
			eachLink
				->
					(setOfTransformedElements
						detect: [ :any | eachLink canRelinkTo: any ]
						ifNone: [ OKModelObjectReference named: eachLink name ]) ].
	resultElementsToLink keysAndValuesDo: [ :link :newElement | link linkedModel: newElement ].
	anOpenPonkDiagram changed