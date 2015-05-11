stepping
setDefaultStepping
	"sets default stepping settings"

	super setDefaultStepping.
	self
		fromSteppableElements;
		orderRandomized;
		selectFirst;
		addAction: [ :item | item doAction: 1 ];
		addAction: [ :item | item doAction: 2 ]