private
updateDependenciesOf: aModel whenChanged: anElementOrModel
	"aModel is updated in dependingModels (so that it is only in values of models that aModel really links to), then the model is transformed or links are updated first (if only a link changed -- transformation of the model happens later via announcement)"

	self
		removeDependenciesOf: aModel;
		addDependenciesOf: aModel whenChanged: anElementOrModel