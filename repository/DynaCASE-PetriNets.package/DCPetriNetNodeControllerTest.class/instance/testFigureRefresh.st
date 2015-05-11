as yet unclassified
testFigureRefresh
	| text |
	ctrl model: ctrl createModel.
	ctrl figure: self renderFigure.
	self assert: (ctrl figure attributeAt: #RTLabelledLabel) text = ''.

	ctrl model name: 'new name'.
	ctrl refreshFigure.
	text := (ctrl figure attributeAt: #RTLabelledLabel) text.
	self assert: ((text last: 8) = 'new name' or: [ (text first: 8) = 'new name' ])