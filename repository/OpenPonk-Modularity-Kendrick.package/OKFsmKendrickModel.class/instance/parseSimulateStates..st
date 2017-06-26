accessing
parseSimulateStates: aString
	self simulateStates: ((aString splitOn: Character space) reject: [ :each | each isEmpty ])