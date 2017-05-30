adding
addAsTargetFor: aRelationshipController
	self assert: (self canBeTargetFor: aRelationshipController).
	aRelationshipController target: self.
	aRelationshipController model
		ifNotNil: [ aRelationshipController model target: self model ].
	aRelationshipController attachTo: self diagramController.
	self model owner add: aRelationshipController model