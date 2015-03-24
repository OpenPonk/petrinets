hooks
createFigure
	^ DCRTCallbackBuilder
		block: [ :view | 
			| aFigure |
			aFigure := self createRoassalShape elementOn: ''.
			aFigure
				@
						(RTLabelled new
								view: view;
								right;
								color: self defaultColor;
								yourself);
				@ RTDraggable;
				@ DCRTFocusable.
			aFigure ]