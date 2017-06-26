accessing
name
	^ String
		streamContents: [ :stream | (parts collect: [ :each | each name ]) asStringOn: stream delimiter: '--' ]