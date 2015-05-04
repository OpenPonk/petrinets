initialization
setDefaultStepping
	"sets default stepping settings"

	super setDefaultStepping.
	self actions: (OrderedCollection with: [ :item | item fireIncoming ] with: [ :item | item fireOutgoing ])