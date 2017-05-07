accessing
attributesAsString
	^ String
		streamContents: [ :stream | 
			attributes
				keysAndValuesDo: [ :key :value | 
					stream
						nextPutAll: key;
						nextPutAll: ': ';
						nextPutAll: value;
						nextPutAll: '. ' ] ]