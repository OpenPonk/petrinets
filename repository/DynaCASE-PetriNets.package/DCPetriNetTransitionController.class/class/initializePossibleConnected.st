class initialization
initializePossibleConnected
	PossibleIncoming := Set
		with: DCPetriNetInhibitorArcController
		with: DCPetriNetNormalArcController
		with: DCPetriNetResetArcController.
	PossibleOutgoing := Set with: DCPetriNetOutputArcController