private
updateLinksIn: aDefinitionModel thenForceAnnounce: forceAnnounce
	"fake announcement from the model"

	aDefinitionModel resetFlags.
	self assert: aDefinitionModel askedToUpdateLinks not.
	super updateLinksIn: aDefinitionModel thenForceAnnounce: forceAnnounce.
	(aDefinitionModel links allSatisfy: [ :each | each isValid ])
		ifTrue: [ self assert: aDefinitionModel askedToUpdateLinks ].
	self changed: aDefinitionModel in: aDefinitionModel