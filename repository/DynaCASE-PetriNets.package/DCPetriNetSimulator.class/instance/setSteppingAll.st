initialization
setSteppingAll
	"sets stepping of all elements
	first removes tokens from all elements then places tokens to all elements"

	self
		setDefaultStepping;
		orderAny;
		selectAll