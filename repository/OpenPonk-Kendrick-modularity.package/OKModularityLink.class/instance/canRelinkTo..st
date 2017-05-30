testing
canRelinkTo: aModelObject
	^ aModelObject canBeLinkedTo
		and: [ aModelObject name = linkedModel name ]