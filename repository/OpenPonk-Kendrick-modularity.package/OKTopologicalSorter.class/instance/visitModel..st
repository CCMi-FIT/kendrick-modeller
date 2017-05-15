private
visitModel: aModel
	(temporarilyMarkedNodes includes: aModel)
		ifTrue: [ self error: 'invalid dependency graph' ].
	(unmarkedNodes includes: aModel)
		ifFalse: [ ^ self ].
	temporarilyMarkedNodes add: aModel.
	unmarkedNodes remove: aModel.
	aModel modules do: [ :eachModule | self visitModel: eachModule linkedModel ].
	temporarilyMarkedNodes remove: aModel.
	sortedModels addLast: aModel