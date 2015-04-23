class initialization
initialize
	super initialize.
	PossibleIncoming := Set with: DCPetriNetOutputArcController.
	PossibleOutgoing := Set
		with: DCPetriNetInhibitorArcController
		with: DCPetriNetNormalArcController
		with: DCPetriNetResetArcController