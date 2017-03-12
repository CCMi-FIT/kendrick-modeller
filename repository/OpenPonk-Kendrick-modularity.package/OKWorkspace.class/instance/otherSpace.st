accessing
otherSpace
	^ self isLeft
		ifTrue: [ self tool rightWorkspace ]
		ifFalse: [ self tool leftWorkspace ]