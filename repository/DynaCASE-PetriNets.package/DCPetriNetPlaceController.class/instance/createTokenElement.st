initialization
createTokenElement
	tokenLabelInteraction := RTLabelled new
		color: self defaultColor;
		left;
		yourself.
	tokenShape := RTEllipse new
		size: 14;
		color: self defaultColor;
		elementOn: ''