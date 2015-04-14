class initialization
initialize
	super initialize.
	PossibleIncoming := #(#DCPetriNetInhibitorArcController #DCPetriNetNormalArcController).
	PossibleOutgoing := #(#DCPetriNetOutputArcController)