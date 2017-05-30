examples
openExamples: models named: aName
	| project |
	project := OKFsmProject named: aName.
	models do: [ :each | project addModel: each ].
	OKWorkbench openProject: project