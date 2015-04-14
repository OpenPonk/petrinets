class initialization
initialize
	super initialize.
	ClassMapping
		at: DCPetriNetOutputArc put: DCPetriNetOutputArcSimulated;
		at: DCPetriNetNormalArc put: DCPetriNetNormalArcSimulated;
		at: DCPetriNetInhibitorArc put: DCPetriNetInhibitorArcSimulated;
		at: DCPetriNetPlace put: DCPetriNetPlaceSimulated;
		at: DCPetriNetTransition put: DCPetriNetTransitionSimulated