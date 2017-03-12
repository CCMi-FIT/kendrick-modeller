examples
exampleEmpty
	| project fsm |
	project := OPProject new projectName: 'New Kendrick FSM'.
	fsm := OKFsm new name: 'New Kendrick FSM'.
	project addModel: fsm.
	OPWorkbench openProject: project