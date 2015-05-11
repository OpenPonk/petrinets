initialization
setDefaultStepping
	"sets default stepping settings"

	super setDefaultStepping.
	self
		addAction: [ :item | item fireIncoming ];
		addAction: [ :item | item fireOutgoing ]