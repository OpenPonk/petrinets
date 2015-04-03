initialization
initialize
	super initialize.
	modelToControllerMapping
		at: DCPetriNetNormalArc put: DCPetriNetNormalArcController;
		at: DCPetriNetOutputArc put: DCPetriNetOutputArcController;
		at: DCPetriNetInhibitorArc put: DCPetriNetInhibitorArcController;
		at: DCPetriNetPlace put: DCPetriNetPlaceController;
		at: DCPetriNetTransition put: DCPetriNetTransitionController