figures
createFigure
	"Just as my ModuleElementLinkController counterpart, I have hardcoded shape on canvas, but my shape (figure) can be easily changed by subclasses if needed."
		
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