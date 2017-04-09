adding
addAsTargetFor: anEdgeController
	self assert: (self canBeTargetFor: anEdgeController).
	anEdgeController target: self.
	anEdgeController model target ifNil: [ anEdgeController model target: self model ].
	anEdgeController attachTo: self diagramController.
	self model owner add: anEdgeController model