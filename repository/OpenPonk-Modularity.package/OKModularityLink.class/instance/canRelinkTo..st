testing
canRelinkTo: aModelObject
	"can I point to aModelObject from now on?"
	
	^ aModelObject canBeLinkedTo
		and: [ aModelObject name = linkedModel name ]