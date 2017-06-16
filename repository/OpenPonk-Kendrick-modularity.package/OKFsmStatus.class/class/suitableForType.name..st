hooks
suitableForType: attributeType name: aString
	^ self kendrickAttributeType = attributeType and: [ aString asSymbol ~= #empty ]