private
updateModuleLinksIn: anOpenPonkDiagram
	"module links are updated to point to current resulting models"

	| setOfTransformedDiagrams resultDiagramsToLink |
	setOfTransformedDiagrams := (resultingModels flatCollectAsSet: [ :eachTransformedSet | eachTransformedSet ]) select: [ :each | each canBeValidLinkedTo ].
	resultDiagramsToLink := (anOpenPonkDiagram modules
		reject: [ :eachLink | setOfTransformedDiagrams includes: eachLink linkedModel ]
		thenCollect:
			[ :eachLink | eachLink -> (setOfTransformedDiagrams detect: [ :any | eachLink canRelinkTo: any ] ifNone: [ OKNamedBrokenReference named: eachLink name ]) ])
		asDictionary.
	resultDiagramsToLink keysAndValuesDo: [ :module :newDiagram | module linkedModel: newDiagram ]