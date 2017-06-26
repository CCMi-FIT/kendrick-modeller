opening
openEditorOn: aViewBuilder
	aViewBuilder renderIn: roassalView.
	roassalView addFromView: aViewBuilder view.
	roassalView @ RTDraggableView.
	roassalView @ RTZoomableView.
	roassalView setDefaultMenu.
	roassalView canvas camera focusOnCenterScaled: 700@700.
	roassalView signalUpdate.