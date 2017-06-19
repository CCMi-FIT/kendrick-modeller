accessing
module
	^ self elements detect: [ :any | any isKindOf: OKModule ] ifNone: [ nil ]