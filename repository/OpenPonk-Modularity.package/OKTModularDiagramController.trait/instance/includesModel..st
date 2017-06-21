testing
includesModel: aModelElement
	[ self controllerForModel: aModelElement ]
		on: NotFound
		do: [ ^ false ].
	^ true