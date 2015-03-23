initialization
tokenShape
	| label circle |
	label := RTLabel new
		color: self defaultColor;
		text: '0';
		yourself.
	(circle := RTEllipse new)
		size: 10;
		color: self defaultColor.
	^ (label + circle)
		horizontal;
		yourself