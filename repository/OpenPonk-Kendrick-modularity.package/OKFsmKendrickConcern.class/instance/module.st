accessing
module
	| modules |
	modules := self modules.
	modules ifEmpty: [ ^ nil ].
	modules size = 1
		ifFalse: [ ^ self error: 'too many modules' ].
	^ modules anyOne