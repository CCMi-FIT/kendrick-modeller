testing
canRelinkTo: aModelObject
	"can I point to aModelObject from now on?"
	
	^ aModelObject canBeLinkedTo
		and: [ (aModelObject respondsTo: #source)
				and: [ aModelObject source name = source name
						and: [ (aModelObject respondsTo: #target)
								and: [ aModelObject target name = target name ] ] ] ]