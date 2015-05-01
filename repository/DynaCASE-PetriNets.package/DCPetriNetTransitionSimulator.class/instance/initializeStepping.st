initialization
initializeStepping
	"sets default stepping settings"

	super initializeStepping.
	self action: [ :item | item fire ]