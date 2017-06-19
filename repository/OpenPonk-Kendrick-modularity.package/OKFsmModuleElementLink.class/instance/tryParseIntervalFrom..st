private
tryParseIntervalFrom: aString
	| pair |
	pair := aString splitOn: $-.
	pair size = 2
		ifFalse: [ ^ nil ].
	^ Interval from: (Number readFrom: pair first trim ifFail: [ ^ nil ]) to: (Number readFrom: pair second trim ifFail: [ ^ nil ])