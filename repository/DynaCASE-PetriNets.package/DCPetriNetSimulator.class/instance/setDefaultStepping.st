stepping
setDefaultStepping
	"sets default stepping settings"

	super setDefaultStepping.
	self
		fromSteppableElements;
		orderRandomized;
		selectFirst;
		resetActions;
		addAction: [ :item | item step ]