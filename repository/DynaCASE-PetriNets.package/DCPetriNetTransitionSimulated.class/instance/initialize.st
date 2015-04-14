initialization
initialize
	super initialize.
	tempTokens := 0.
	firing := false.
	self addAction: [ self fire ]