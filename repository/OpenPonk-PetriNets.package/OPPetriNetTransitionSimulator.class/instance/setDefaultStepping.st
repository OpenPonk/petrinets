initialization
setDefaultStepping
	"sets default stepping settings"

	super setDefaultStepping.
	self
		resetActions;
		addAction: [ :item | item fireIncoming ];
		addAction: [ :item | item fireOutgoing ]