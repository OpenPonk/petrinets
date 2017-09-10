initialization
initialClassMapping
	^ super initialClassMapping
		at: OPPetriNetNormalArc put: OPPetriNetNormalArcSimulator;
		at: OPPetriNetInhibitorArc put: OPPetriNetInhibitorArcSimulator;
		at: OPPetriNetResetArc put: OPPetriNetResetArcSimulator;
		at: OPPetriNetPlace put: OPPetriNetPlaceSimulator;
		at: OPPetriNetTransition put: OPPetriNetTransitionSimulator;
		yourself