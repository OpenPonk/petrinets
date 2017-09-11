widget API
iconMapping
	^ {(OPPetriNet -> OPPetriNetsIcons current petriNetIcon).
	(OPPetriNetInhibitorArc -> OPPetriNetsIcons current inhibitorArcIcon).
	(OPPetriNetResetArc -> OPPetriNetsIcons current resetArcIcon).
	(OPPetriNetWeightedArc -> OPPetriNetsIcons current arcIcon).
	(OPPetriNetPlaceWithTokens -> OPPetriNetsIcons current placeIcon).
	(OPPetriNetTransition -> OPPetriNetsIcons current transitionIcon)}