initialization
initialize
	super initialize.
	possibleIncoming := Set with: DCPetriNetOutputArcController.
	possibleOutgoing := Set with: DCPetriNetInhibitorArcController with: DCPetriNetNormalArcController