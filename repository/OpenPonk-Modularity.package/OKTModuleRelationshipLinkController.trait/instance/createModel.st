hooks
createModel
	self model ifNotNil: [ ^ self model ].
	^ self modelClass from: self source model to: self target model