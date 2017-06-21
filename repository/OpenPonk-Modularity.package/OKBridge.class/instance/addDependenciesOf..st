private
addDependenciesOf: aModel
	aModel modules do: [ :each | (self dependingModelsOn: each) add: aModel ].
	self transform: aModel