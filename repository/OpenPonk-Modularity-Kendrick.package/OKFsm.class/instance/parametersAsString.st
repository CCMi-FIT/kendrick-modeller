accessing
parametersAsString
	^ String
		streamContents: [ :stream | 
			parameters
				keysAndValuesDo: [ :key :value | 
					stream
						nextPutAll: key;
						nextPutAll: ': ';
						nextPutAll: value;
						nextPutAll: '. ' ] ]