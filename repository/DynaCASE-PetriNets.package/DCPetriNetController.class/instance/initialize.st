initialization
initialize
	super initialize.
	modelToControllerMapping
		at: DCPetriNetNormalArc put: DCPetriNetNormalArcController;
		at: DCPetriNetInhibitorArc put: DCPetriNetInhibitorArcController;
		at: DCPetriNetPlace put: DCPetriNetPlaceController;
		at: DCPetriNetTransition put: DCPetriNetTransitionController