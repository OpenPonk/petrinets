accessing
modelToControllerMapping
	^ Dictionary
		newFrom:
			{DCPetriNetInhibitorArc -> DCPetriNetInhibitorArcController.
			DCPetriNetResetArc -> DCPetriNetResetArcController.
			DCPetriNetNormalArc -> DCPetriNetNormalArcController.
			DCPetriNetTransition -> DCPetriNetTransitionController.
			DCPetriNetPlace -> DCPetriNetPlaceController}