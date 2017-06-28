printing
printOn: aStream
	super printOn: aStream.
	aStream << ' (''' << self name << ''')'.
	self isValid
		ifFalse: [ aStream << '[invalid]' ]