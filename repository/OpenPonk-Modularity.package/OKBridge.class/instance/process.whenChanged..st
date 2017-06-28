private
process: aDefinitionModel whenChanged: anElementOrModel
	"aDefinitionModel is transformed or links are updated first (if only a link changed -- transformation of the model happens later via announcement)"

	anElementOrModel isLink
		ifTrue: [ self updateLinksIn: aDefinitionModel thenForceAnnounce: true ]
		ifFalse: [ self transform: aDefinitionModel ]