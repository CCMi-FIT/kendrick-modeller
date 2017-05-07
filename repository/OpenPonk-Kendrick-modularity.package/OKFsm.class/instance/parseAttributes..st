accessing
parseAttributes: aString
	| parts |
	parts := (aString splitOn: '.') flatCollect: [ :each | each splitOn: ':' ].
	self attributes: (Dictionary newFromPairs: (parts collect: [ :each | each trimmed ]))