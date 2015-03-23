hooks
createFigure
	^ DCRTCallbackBuilder
		block: [ :view | 
			| aFigure |
			aFigure := self roassalShape elementOn: ''.
			aFigure
				@
						(RTLabelled new
								view: view;
								below;
								color: Color red;
								yourself);
				@ RTDraggable;
				@ DCRTFocusable.
			aFigure ]