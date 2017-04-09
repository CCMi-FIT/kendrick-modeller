examples
exampleEmptyKendrickModel
	| model project |
	model := self modelExampleEmptyKendrickModel.
	project := OPProject named: model name.
	project addModel: model.
	OPWorkbench openProject: project.
	^ project