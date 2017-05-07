figures
createFigure
	^ OPRTCallbackBuilder
		block: [ :view | 
			| roassalShape |
			roassalShape := RTBox new
				height: 30;
				width: 150;
				color: Color veryLightGray;
				borderColor: Color veryVeryDarkGray;
				yourself.
			(roassalShape elementOn: self model)
				setAsFixed;
				@
					(RTLabeled new
						view: view;
						center;
						fontSize: 12;
						color: Color black;
						yourself);
				@ OPRTFocusable;
				yourself ]