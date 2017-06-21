accessing
splitIndexesAsString
	^ String
		streamContents: [ :stream | 
			splitIndexes isInterval
				ifTrue: [ stream << splitIndexes first << ' - ' << splitIndexes last ]
				ifFalse: [ splitIndexes asStringOn: stream delimiter: ' ' ] ]