examples
openExamples: models named: aName
	| project |
	project := OKProject named: aName.
	models do: [ :each | project addModel: each ].
	OKWorkbench openProject: project