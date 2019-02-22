tests
testFigureRefresh
	| label |
	super testFigureRefresh.

	label := controller figure labels at: #weight.
	self assert: label trachelShape text = ''.

	controller model weight: 10.
	controller refreshFigure.
	self assert: (label trachelShape text last: 2) = '10'