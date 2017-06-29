tests
testIsValid
	self deny: link isValid.
	link linkedModel: (OKDummyElement named: 'x').
	self assert: link isValid.
	link linkedModel: (OKDummyElement named: '').
	self deny: link isValid.
	link linkedModel: (OKDummyElement named: 'x').
	self assert: link isValid.
	link linkedModel: (OKNamedBrokenReference named: 'x').
	self deny: link isValid