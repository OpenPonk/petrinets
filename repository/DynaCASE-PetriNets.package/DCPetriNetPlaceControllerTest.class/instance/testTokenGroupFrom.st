tests
testTokenGroupFrom
	| prevTokenPosition |
	ctrl tokenGroupFrom: 0.
	self assert: ctrl tokenCircle trachelShape color = Color transparent.
	self assert: (ctrl tokenLabel trachelShape color = Color transparent | ctrl tokenLabel trachelShape text) = ''.

	ctrl tokenGroupFrom: 1.
	self assert: ctrl tokenCircle trachelShape color = Color black.
	self assert: (ctrl tokenLabel trachelShape color = Color transparent | ctrl tokenLabel trachelShape text) = ''.
	self assert: ctrl tokenCircle position = ctrl figure position.
	prevTokenPosition := ctrl tokenCircle position.

	ctrl tokenGroupFrom: 11.
	self assert: ctrl tokenCircle trachelShape color = Color black.
	self assert: ctrl tokenLabel trachelShape color = Color black.
	self assert: [ ctrl tokenLabel trachelShape text = '11' ].
	self assert: ctrl tokenCircle position y = prevTokenPosition y.
	self assert: ctrl tokenCircle position x > prevTokenPosition x.
	prevTokenPosition := ctrl tokenCircle position.

	ctrl tokenGroupFrom: 9.
	self assert: ctrl tokenCircle trachelShape color = Color black.
	self assert: ctrl tokenLabel trachelShape color = Color black.
	self assert: [ ctrl tokenLabel trachelShape text = '9' ].
	self assert: ctrl tokenCircle position y = prevTokenPosition y.
	self assert: ctrl tokenCircle position x < prevTokenPosition x.
	self assert: ctrl tokenCircle position x > ctrl figure position x.
	prevTokenPosition := ctrl tokenCircle position.

	ctrl tokenGroupFrom: 1.
	self assert: ctrl tokenCircle trachelShape color = Color black.
	self assert: (ctrl tokenLabel trachelShape color = Color transparent | ctrl tokenLabel trachelShape text) = ''.
	self assert: ctrl tokenCircle position = ctrl figure position.
	prevTokenPosition := ctrl tokenCircle position.
	ctrl tokenGroupFrom: 1.

	ctrl tokenGroupFrom: 0.
	self assert: ctrl tokenCircle trachelShape color = Color transparent.
	self assert: (ctrl tokenLabel trachelShape color = Color transparent | ctrl tokenLabel trachelShape text) = ''.
	
self assert: false.