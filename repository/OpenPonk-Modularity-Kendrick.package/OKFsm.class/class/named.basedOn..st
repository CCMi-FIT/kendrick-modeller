instance creation
named: aString basedOn: aKendrickModel
	^ (self basedOn: aKendrickModel)
		name: aString;
		yourself