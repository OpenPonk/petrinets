hooks
refreshFigure
	adornments ifEmpty: [ adornments add: self createAdornment ].
	super refreshFigure