class initialization
initialize
	super initialize.
	PossibleIncoming := {DCPetriNetOutputArcController}.
	PossibleOutgoing := {DCPetriNetInhibitorArcController. DCPetriNetNormalArcController}