class initialization
initializePossibleConnected
	PossibleIncoming := Set with: DCPetriNetOutputArcController.
	PossibleOutgoing := Set
		with: DCPetriNetInhibitorArcController
		with: DCPetriNetNormalArcController
		with: DCPetriNetResetArcController