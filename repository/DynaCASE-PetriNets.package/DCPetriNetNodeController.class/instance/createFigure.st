hooks
createFigure
	^ DCRTCallbackBuilder
		block: [ :view | 
			(self createRoassalShape elementOn: '')
				addInteraction:
						(RTLabelled new
								view: view;
								below;
								color: Color black;
								yourself);
				addInteraction: RTDraggable;
				addInteraction: DCRTFocusable;
				yourself ]