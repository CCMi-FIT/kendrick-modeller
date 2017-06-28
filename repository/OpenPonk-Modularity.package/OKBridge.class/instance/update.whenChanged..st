private
update: aDefinitionModel whenChanged: anElementOrModel
	"aDefinitionModel is updated in dependingModels (so that it is only in values of models that aDefinitionModel really links to), then the model is transformed or links are updated first (if only a link changed -- transformation of the model happens later via announcement)"

	self
		removeDependenciesOf: aDefinitionModel;
		addDependenciesOf: aDefinitionModel;
		process: aDefinitionModel whenChanged: anElementOrModel