hooks
classFor: attributeType name: aString
	^ self allSubclasses detect: [ :any | any suitableForType: attributeType name: aString ]