initialization
initialize
	super initialize.
	firing := false.
	self addAction: [ self fire ]