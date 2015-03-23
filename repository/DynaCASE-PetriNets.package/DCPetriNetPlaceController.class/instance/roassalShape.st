initialization
roassalShape
	| basicShape |
	(basicShape := RTEllipse new)
		size: 40;
		color: Color transparent;
		borderColor: self defaultColor.
	^ basicShape + self tokenShape