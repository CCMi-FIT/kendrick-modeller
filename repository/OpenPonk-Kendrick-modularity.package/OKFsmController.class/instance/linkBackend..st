adding
linkBackend: aModel
	self linkDependenciesOf: aModel.
	(OKFsmBackendModuleController linkedModel: aModel) addTo: self