initialization
initialize
	super initialize.
	classMapping
		at: DCPetriNetOutputArc put: DCPetriNetOutputArcSimulated;
		at: DCPetriNetNormalArc put: DCPetriNetNormalArcSimulated;
		at: DCPetriNetInhibitorArc put: DCPetriNetInhibitorArcSimulated;
		at: DCPetriNetPlace put: DCPetriNetPlaceSimulated;
		at: DCPetriNetTransition put: DCPetriNetTransitionSimulated