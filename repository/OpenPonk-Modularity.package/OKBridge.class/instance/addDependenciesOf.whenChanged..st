private
addDependenciesOf: aModel whenChanged: anElementOrModel
	"aModel is added to values in dependingModels (so that it inditaces that something depends on aModel) and then the model is transformed or links are updated first (if only a link changed -- transformation of the model happens later via announcement)"
	aModel modules do: [ :each | (self dependingModelsOn: each) add: aModel ].
	anElementOrModel isLink
		ifTrue: [ self updateLinksIn: aModel thenForceAnnounce: true ]
		ifFalse: [ self transform: aModel ]