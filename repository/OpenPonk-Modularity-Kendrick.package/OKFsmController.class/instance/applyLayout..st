userinterface
applyLayout: anAlgorithm
	| figures edges |
	self controllers ifEmpty: [ ^ self ].
	figures := self controllers select: [ :each | each model isState ] thenCollect: #figure.
	edges := (figures flatCollect: #connectedEdges) reject: [ :each | each from = each to ].
	anAlgorithm on: figures edges: edges.
	self view canvas camera focusOnCenterScaled