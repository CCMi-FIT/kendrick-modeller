instance creation
named: aString basedOn: attributeType
	^ (self basedOn: attributeType name: aString)
		name: aString;
		yourself