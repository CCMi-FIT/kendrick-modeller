accessing
enabledPlugins
	^ (projectController ifNil: [ {} ] ifNotNil: [ self project enabledPlugins ])
		asOrderedCollection