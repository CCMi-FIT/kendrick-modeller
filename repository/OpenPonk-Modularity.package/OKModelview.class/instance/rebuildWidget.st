building widgets
rebuildWidget
	self widgets removeAll.
	self createWidgets.
	self needFullRebuild: false.
	^ self buildWithSpec