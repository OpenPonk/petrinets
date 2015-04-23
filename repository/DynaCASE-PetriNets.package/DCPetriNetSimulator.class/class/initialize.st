class initialization
initialize
	super initialize.
	ClassMapping
		at: DCPetriNetOutputArc put: DCPetriNetOutputArcSimulator;
		at: DCPetriNetNormalArc put: DCPetriNetNormalArcSimulator;
		at: DCPetriNetInhibitorArc put: DCPetriNetInhibitorArcSimulator;
		at: DCPetriNetResetArc put: DCPetriNetResetArcSimulator;
		at: DCPetriNetPlace put: DCPetriNetPlaceSimulator;
		at: DCPetriNetTransition put: DCPetriNetTransitionSimulator