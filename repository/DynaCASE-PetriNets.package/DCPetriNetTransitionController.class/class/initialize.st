class initialization
initialize
	super initialize.
	PossibleIncoming := Set
		with: DCPetriNetInhibitorArcController
		with: DCPetriNetNormalArcController
		with: DCPetriNetResetArcController.
	PossibleOutgoing := Set with: DCPetriNetOutputArcController