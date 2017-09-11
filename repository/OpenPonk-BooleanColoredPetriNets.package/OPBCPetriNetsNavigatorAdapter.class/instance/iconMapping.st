widget API
iconMapping
	^ {(OPBCPetriNet -> OPPetriNetsIcons current petriNetIcon).
	(OPPetriNetArcWithExpression -> OPPetriNetsIcons current arcIcon).
	(OPPetriNetPlaceWithBooleanToken -> OPPetriNetsIcons current placeIcon).
	(OPPetriNetTransition -> OPPetriNetsIcons current transitionIcon)}