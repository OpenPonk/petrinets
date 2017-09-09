hooks
createFigure
	^ OPRTCallbackBuilder
		block: [ :view | 
			(self createRoassalShape elementOn: model)
				addInteraction:
					(RTLabeled new
						view: view;
						below;
						color: Color black;
						yourself);
				addInteraction: RTDraggable;
				addInteraction: OPRTFocusable;
				yourself ]