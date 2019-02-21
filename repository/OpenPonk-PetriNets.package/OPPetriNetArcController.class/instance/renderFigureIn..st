rendering
renderFigureIn: aView
	figure := self edgeBuilder createFigureFrom: source figure to: target figure view: aView.
	self diagramController figureAdded: figure