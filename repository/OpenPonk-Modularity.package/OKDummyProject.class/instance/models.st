accessing
models
	^ models
		ifNil: [ | x y |
			x := OKDummyModel named: 'X'.
			y := OKDummyModel named: 'Y'.
			y dependsOnModelNamed: 'X-e2-r2'.
			models := {x. y} ]