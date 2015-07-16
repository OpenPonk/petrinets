accessing
iconMapping
	^ {(DCPetriNet -> DCPetriNetsIcons current petriNetIcon).
	(DCPetriNetInhibitorArc -> DCPetriNetsIcons current inhibitorArcIcon).
	(DCPetriNetResetArc -> DCPetriNetsIcons current resetArcIcon).
	(DCPetriNetOutputArc -> DCPetriNetsIcons current outputArcIcon).
	(DCPetriNetWeightedArc -> DCPetriNetsIcons current arcIcon).
	(DCPetriNetPlace -> DCPetriNetsIcons current placeIcon).
	(DCPetriNetTransition -> DCPetriNetsIcons current transitionIcon)}