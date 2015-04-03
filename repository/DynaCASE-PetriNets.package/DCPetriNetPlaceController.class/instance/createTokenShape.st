initialization
createTokenShape
	| label circle |
	label := RTLabel new
		color: Color white;
		text: ' ';
		yourself.
	(circle := RTEllipse new)
		size: 14;
		color: self defaultColor.
	^ circle + label