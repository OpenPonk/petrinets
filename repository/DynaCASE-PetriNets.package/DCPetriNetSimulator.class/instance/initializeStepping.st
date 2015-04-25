initialization
initializeStepping
	super initializeStepping.
	self actions: (OrderedCollection with: [ :item | item fireIncoming ] with: [ :item | item fireOutgoing ])