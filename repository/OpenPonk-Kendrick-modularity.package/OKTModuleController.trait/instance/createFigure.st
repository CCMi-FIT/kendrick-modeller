as yet unclassified
createFigure
	^ OPRTCallbackBuilder
		block: [ :view | 
			| roassalShape |
			roassalShape := RTBox new
				height: 30;
				width: 120;
				color: Color veryVeryLightGray;
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