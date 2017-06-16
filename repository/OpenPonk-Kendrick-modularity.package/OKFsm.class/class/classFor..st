hooks
classFor: aKendrickModel
	^ ((aKendrickModel isKindOf: KEModelPart)
		ifTrue: [ OKFsmKendrickConcern ]
		ifFalse: [ OKFsmKendrickModel ]) classFor: aKendrickModel