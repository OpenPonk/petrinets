initialization
setDefaultStepping
	"sets default stepping settings"

	super setDefaultStepping.
	self
		fromSteppableElements;
		inRandomOrder;
		selectFirst;
		actions: (OrderedCollection with: [ :item | item doAction: 1 ] with: [ :item | item doAction: 2 ])