initialization
createRoassalShape
	| basicShape |
	(basicShape := RTEllipse new)
		size: 40;
		color: Color transparent;
		borderColor: self defaultColor.
	^ self createTokenShape + basicShape