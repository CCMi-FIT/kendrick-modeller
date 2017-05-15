api
sort
	[ unmarkedNodes isEmpty ]
		whileFalse: [ | current |
			current := unmarkedNodes first.
			unmarkedNodes removeFirst.
			self visitModel: current ].
	^ sortedModels