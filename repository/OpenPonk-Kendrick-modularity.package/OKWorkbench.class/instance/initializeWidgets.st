initialization
initializeWidgets
	topToolbar := self instantiate: OKWorkbenchToolbar.
	editWorkspace := self instantiate: OKEditWorkspace.
	resultWorkspace := self instantiate: OKResultWorkspace.
	diffToolbar := self instantiate: OKDiffToolbar.
	editWorkspace workbench: self.
	resultWorkspace workbench: self