api
transformModels: aModelCollection
	^ self
		models: aModelCollection;
		transform;
		transformedModels