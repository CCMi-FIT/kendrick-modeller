initialization
initializeWidgets
	tabManager := self newTabManager.
	formModel := self instantiate: OPDynamicForm.

	self focusOrder
		add: tabManager;
		add: formModel