hooks
simulableControllerClasses
	"collection of element controllers whose single simulators can be fired independently
	for example: in Petri nets, only transitions are simulable = one specific transition can be fired"

	^ OPPetriNetTransitionController asOrderedCollection