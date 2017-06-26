accessing
simulateStatesAsString
	^ String streamContents: [ :stream | simulateStates asStringOn: stream delimiter: ' ' ]