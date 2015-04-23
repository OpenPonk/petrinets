class initialization
initialize
	super initialize.
	ModelToControllerMapping
		at: DCPetriNetNormalArc put: DCPetriNetNormalArcController;
		at: DCPetriNetOutputArc put: DCPetriNetOutputArcController;
		at: DCPetriNetInhibitorArc put: DCPetriNetInhibitorArcController;
		at: DCPetriNetResetArc put: DCPetriNetResetArcController;
		at: DCPetriNetPlace put: DCPetriNetPlaceController;
		at: DCPetriNetTransition put: DCPetriNetTransitionController