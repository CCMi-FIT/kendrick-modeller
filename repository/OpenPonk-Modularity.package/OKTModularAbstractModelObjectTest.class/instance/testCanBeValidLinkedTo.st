tests
testCanBeValidLinkedTo
	object name: ''.
	self deny: object canBeValidLinkedTo.
	object name: 'test'.
	self assert: object canBeValidLinkedTo