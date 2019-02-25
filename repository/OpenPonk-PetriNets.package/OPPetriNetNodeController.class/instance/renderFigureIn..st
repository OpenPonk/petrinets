rendering
renderFigureIn: aView
	figure := self createRoassalShape elementOn: self model.
	figure
		addInteraction:
			(RTLabeled new
				view: aView;
				below;
				color: Color black;
				yourself).
	figure @ RTDraggable.
	figure @ OPRTFocusable.
	figure renderIn: aView.
	self diagramController figureAdded: figure.
	^ figure