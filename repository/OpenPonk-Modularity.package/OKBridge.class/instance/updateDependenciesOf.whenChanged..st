private
updateDependenciesOf: aModel whenChanged: anElementOrModel
	self
		removeDependenciesOf: aModel;
		addDependenciesOf: aModel whenChanged: anElementOrModel