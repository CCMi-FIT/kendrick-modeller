examples
exampleSIR
	| model project |
	model := self modelExampleSIR.
	project := OPProject named: model name.
	project addModel: model.
	OPWorkbench openProject: project.
	^ project