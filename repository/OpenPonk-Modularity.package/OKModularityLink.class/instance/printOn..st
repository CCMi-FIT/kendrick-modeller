printing
printOn: aStream
	super printOn: aStream.
	self isValid
		ifFalse: [ aStream nextPutAll: '(invalid)' ]