accessing
module
	^ self elements detect: [ :any | any isKindOf: OKModuleLink ] ifNone: [ nil ]