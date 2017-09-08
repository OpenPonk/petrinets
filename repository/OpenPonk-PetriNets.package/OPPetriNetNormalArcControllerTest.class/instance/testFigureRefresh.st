tests
testFigureRefresh
	| label |
	super testFigureRefresh.

	label := ctrl figure labels at: #weight.
	self assert: label trachelShape text = ''.

	ctrl model weight: 10.
	ctrl refreshFigure.
	self assert: (label trachelShape text last: 2) = '10'