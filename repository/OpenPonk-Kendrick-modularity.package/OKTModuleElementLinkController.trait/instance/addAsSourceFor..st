adding
addAsSourceFor: anEdgeController
	self assert: (self canBeSourceFor: anEdgeController).
	anEdgeController source: self.
	anEdgeController model source ifNil: [ anEdgeController model source: self model ]