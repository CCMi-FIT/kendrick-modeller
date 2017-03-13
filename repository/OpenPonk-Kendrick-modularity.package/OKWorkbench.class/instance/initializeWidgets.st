initialization
initializeWidgets
	topToolbar := self instantiate: OKWorkbenchToolbar.
	leftWorkspace := self instantiate: OKWorkspace.
	rightWorkspace := self instantiate: OKWorkspace.
	diffToolbar := self instantiate: OKDiffToolbar.
	leftWorkspace tool: self.
	rightWorkspace tool: self