widget API
displayMapping
	^ {(OPPetriNet -> 'Diagram').
	(OPPetriNetInhibitorArc -> 'Inhibitor Arc').
	(OPPetriNetResetArc -> 'Reset Arc').
	(OPPetriNetWeightedArc -> 'Arc').
	(OPPetriNetPTPlace -> 'Place').
	(OPPetriNetTransition -> 'Transition')}