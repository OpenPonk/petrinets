initialization
createTokenShape
	| label circle |
	label := RTLabel new
		color: self defaultColor;
		text: ' ';
		yourself.
	(circle := RTEllipse new)
		size: 10;
		color: self defaultColor.
	^ (label + circle)
		setAutomaticRelayout;
		horizontal;
		yourself