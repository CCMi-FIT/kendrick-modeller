figures
createFigure
	^ OPRTCallbackBuilder
		block: [ :view | 
			| roassalShape |
			roassalShape := RTBox new
				height: 26;
				width: 150;
				colorElement: [ :el | 
					self model isValid
						ifTrue: [ Color veryVeryLightGray ]
						ifFalse: [ Color red ] ];
				borderColor: Color veryVeryDarkGray;
				borderWidth: 1.5;
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