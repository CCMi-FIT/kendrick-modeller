accessing
parseParameters: aString
	| parts |
	parts := (aString splitOn: '.') flatCollect: [ :each | each splitOn: ':' ].
	self parameters: (Dictionary newFromPairs: (parts collect: [ :each | each trimmed ]))