tests
testCanBeValidLinkedTo
	self deny: link canBeValidLinkedTo.
	link linkedModel: (OKDummyElement named: 'x').
	self assert: link canBeValidLinkedTo.
	link linkedModel: (OKDummyElement named: '').
	self deny: link canBeValidLinkedTo.
	link linkedModel: (OKDummyElement named: 'x').
	self assert: link canBeValidLinkedTo.
	link linkedModel: (OKNamedBrokenReference named: 'x').
	self deny: link canBeValidLinkedTo