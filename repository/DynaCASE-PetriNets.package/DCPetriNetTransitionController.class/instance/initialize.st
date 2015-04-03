initialization
initialize
	super initialize.
	possibleIncoming := Set with: DCPetriNetInhibitorArcController with: DCPetriNetNormalArcController.
	possibleOutgoing := Set with: DCPetriNetOutputArcController