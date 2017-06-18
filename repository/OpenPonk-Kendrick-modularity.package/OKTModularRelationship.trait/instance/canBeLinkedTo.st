testing
canBeLinkedTo
	^ self source name asString isNotEmpty
		and: [ self target name asString isNotEmpty ]