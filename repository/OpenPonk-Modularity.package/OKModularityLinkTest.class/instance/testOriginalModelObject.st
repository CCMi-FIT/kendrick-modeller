tests
testOriginalModelObject
	| obj |
	obj := OKDummyElement named: 'x'.
	link linkedModel: obj.
	self assert: (link originalModelObject == obj)