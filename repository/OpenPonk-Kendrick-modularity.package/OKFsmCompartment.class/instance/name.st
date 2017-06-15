accessing
name
	^ String
		streamContents: [ :stream | (parts collect: [ :each | each name ]) printOn: stream delimiter: '--' ]