accessing
parseSplitIndexes: aString
	(self tryParseIntervalFrom: aString)
		ifNotNil: [ :interval | ^ self splitIndexes: interval ].
	self splitIndexes: ((aString splitOn: Character space) reject: [ :each | each isEmpty ])