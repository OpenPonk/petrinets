tests
testTokenGroupFrom
	ctrl figure: (ctrl createFigure renderIn: view).
	ctrl tokenGroupFrom: 0.
	self assert: ctrl tokenCircle trachelShape color = Color transparent.
	self assert: ctrl tokenLabel trachelShape color = Color transparent | (ctrl tokenLabel trachelShape text = '').
	ctrl tokenGroupFrom: 1.
	self assert: ctrl tokenCircle trachelShape color = Color black.
	self assert: ctrl tokenLabel trachelShape color = Color transparent | (ctrl tokenLabel trachelShape text = '').
	ctrl tokenGroupFrom: 111.
	self assert: ctrl tokenCircle trachelShape color = Color black.
	self assert: ctrl tokenLabel trachelShape color = Color black.
	self assert: ctrl tokenLabel trachelShape text = '111'.
	ctrl tokenGroupFrom: 9.
	self assert: ctrl tokenCircle trachelShape color = Color black.
	self assert: ctrl tokenLabel trachelShape color = Color black.
	self assert: ctrl tokenLabel trachelShape text = '9'.
	ctrl tokenGroupFrom: 1.
	self assert: ctrl tokenCircle trachelShape color = Color black.
	self assert: ctrl tokenLabel trachelShape color = Color transparent | (ctrl tokenLabel trachelShape text = '').
	ctrl tokenGroupFrom: 1.
	ctrl tokenGroupFrom: 0.
	self assert: ctrl tokenCircle trachelShape color = Color transparent.
	self assert: ctrl tokenLabel trachelShape color = Color transparent | (ctrl tokenLabel trachelShape text = '')