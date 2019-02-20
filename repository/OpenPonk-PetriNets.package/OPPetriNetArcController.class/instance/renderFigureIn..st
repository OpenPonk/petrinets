rendering
renderFigureIn: aView
	source ifNil: [ self source: (self diagramController controllerForModel: model source) ].
	target ifNil: [ self target: (self diagramController controllerForModel: model target) ].
	figure := self edgeBuilder createFigureFrom: source figure to: target figure view: aView.
	self diagramController figureAdded: figure