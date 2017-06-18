accessing
additionalCodeBlock
	^ BlockClosure readFrom: '[ :model | ' , self additionalCode , ' ]'