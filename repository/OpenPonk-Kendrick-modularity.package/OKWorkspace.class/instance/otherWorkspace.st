accessing
otherWorkspace
	^ self isLeft
		ifTrue: [ self workbench rightWorkspace ]
		ifFalse: [ self workbench leftWorkspace ]