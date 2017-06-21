adding
addAsSourceFor: aRelationshipController
	self assert: (self canBeSourceFor: aRelationshipController).
	aRelationshipController source: self.
	aRelationshipController model
		ifNotNil: [ aRelationshipController model source: self model ]