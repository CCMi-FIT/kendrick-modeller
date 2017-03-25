examples
exampleSpecies
	| model project |
	model := self modelExampleSpecies.
	project := OPProject named: model name.
	project addModel: model.
	OPWorkbench openProject: project.
	^ project