hooks
createTokenElement
	tokenLabelInteraction := RTLabelled new
		color: self defaultColor;
		left;
		yourself.
	tokenShape := RTEllipse new
		size: 12;
		color: self defaultColor;
		elementOn: ''