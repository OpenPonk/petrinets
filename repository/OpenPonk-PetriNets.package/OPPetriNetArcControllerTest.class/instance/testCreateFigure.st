tests
testCreateFigure
	| figure previousElementsSize |
	controller
		source: fromCtrl;
		target: toCtrl;
		model: model.
	diagramController addController: controller.
	previousElementsSize := diagramController view elements size.
	figure := controller renderFigureIn: diagramController view.
	self assert: figure class = RTEdge.
	self assert: figure from = fromCtrl figure.
	self assert: figure to = toCtrl figure.
	self assert: diagramController view elements size = (previousElementsSize + self amountOfLabels).
	self assert: (figure shape isKindOf: RTStyledMultiLine).
	self assert: figure shape color = Color black.
	self assert: figure shape head shape = self desiredHeadShape.
	self assert: figure shape dashes isNil