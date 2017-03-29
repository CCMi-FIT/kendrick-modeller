hooks
createFigure
	^ OPRTCallbackBuilder
		block: [ :view | 
			| element |
			element := self createRoassalShape elementOn: self model.
			element
				setAsFixed;
				@
					(RTLabeled new
						view: view;
						center;
						fontSize: 12;
						color: Color black;
						yourself);
				@ OPRTFocusable.
			element ]