widget API
displayMapping
	^ {(OPPetriNet -> 'Diagram').
	(OPPetriNetInhibitorArc -> 'Inhibitor Arc').
	(OPPetriNetResetArc -> 'Reset Arc').
	(OPPetriNetWeightedArc -> 'Arc').
	(OPPetriNetPlaceWithTokens -> 'Place').
	(OPPetriNetTransition -> 'Transition')}