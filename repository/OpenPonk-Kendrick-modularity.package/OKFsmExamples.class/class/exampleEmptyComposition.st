examples
exampleEmptyComposition
	| model project |
	model := self modelExampleEmptyComposition.
	project := OPProject named: model name.
	project addModel: model.
	OPWorkbench openProject: project.
	^ project