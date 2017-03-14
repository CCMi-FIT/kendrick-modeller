userinterface
applyDefaultLayout
	self
		applyLayout:
			(RTSugiyamaLayout  new
				horizontalGap: 90;
				verticalGap: 80;
				doNotAttachPoint;
				yourself)