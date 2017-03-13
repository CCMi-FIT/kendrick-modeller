initialization
initializeWidgets
	topToolbar := self instantiate: OKWorkbenchToolbar.
	leftWorkspace := self instantiate: OKWorkspace.
	rightWorkspace := self instantiate: OKWorkspace.
	diffToolbar := self instantiate: OKDiffToolbar.
	leftWorkspace workbench: self.
	rightWorkspace workbench: self