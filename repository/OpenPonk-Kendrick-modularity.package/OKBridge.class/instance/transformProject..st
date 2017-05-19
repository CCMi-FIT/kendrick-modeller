api
transformProject: anOpenPonkProject
	^ self
		project: anOpenPonkProject;
		transform;
		transformedModels