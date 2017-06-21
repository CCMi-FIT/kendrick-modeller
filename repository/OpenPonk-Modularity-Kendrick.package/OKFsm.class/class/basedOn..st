instance creation
basedOn: aKendrickModel
	^ (self classFor: aKendrickModel) new
		externalKendrickModel: aKendrickModel;
		yourself