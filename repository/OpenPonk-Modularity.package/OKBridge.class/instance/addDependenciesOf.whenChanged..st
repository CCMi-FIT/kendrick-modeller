private
addDependenciesOf: aModel whenChanged: anElementOrModel
	aModel modules do: [ :each | (self dependingModelsOn: each) add: aModel ].
	anElementOrModel isLink
		ifTrue: [ self updateLinksIn: aModel thenAnnounce: true ]
		ifFalse: [ self transform: aModel ]