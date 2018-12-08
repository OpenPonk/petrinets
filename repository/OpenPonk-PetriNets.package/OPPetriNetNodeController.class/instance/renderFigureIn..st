rendering
renderFigureIn: aView
	| builder |
	builder := OPRTCallbackBuilder
		block: [ :view | 
			(self createRoassalShape elementOn: self model)
				addInteraction:
					(RTLabeled new
						view: view;
						below;
						color: Color black;
						yourself);
				addInteraction: RTDraggable;
				addInteraction: OPRTFocusable;
				yourself ].
	figure := builder renderIn: aView.
	self diagramController figureAdded: figure.
	^ figure