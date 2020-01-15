initialization
initialize
	super initialize.
	capacity := SmallInteger maxVal. "cannot use infinity, because it cannot be easily transformed to STON"
	self removeTokens