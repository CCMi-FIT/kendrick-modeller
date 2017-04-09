printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: '['.
	self source printOn: aStream.
	aStream nextPutAll: '->'.
	self target printOn: aStream.
	aStream nextPutAll: ']'