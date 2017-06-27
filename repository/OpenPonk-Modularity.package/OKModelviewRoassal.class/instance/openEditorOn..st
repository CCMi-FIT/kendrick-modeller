opening
openEditorOn: aRoassalView
	roassalView addFromView: aRoassalView.
	roassalView @ RTDraggableView.
	roassalView @ RTZoomableView.
	roassalView setDefaultMenu.
	roassalView canvas camera focusOnCenterScaled: 700 @ 700. "yes, this line expects a canvas of this size, because it seems there is no proper way to scale, because the window has (probably) not been properly created yet"
	roassalView signalUpdate