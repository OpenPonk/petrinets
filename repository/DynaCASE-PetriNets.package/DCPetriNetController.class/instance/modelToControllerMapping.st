accessing
modelToControllerMapping
	^ Dictionary
		newFrom:
			{DCPetriNetInhibitorArc -> DCPetriNetInhibitorArcController.
			DCPetriNetResetArc -> DCPetriNetResetArcController.
			DCPetriNetNormalArc -> DCPetriNetNormalArcController.
			DCPetriNetOutputArc -> DCPetriNetOutputArcController.
			DCPetriNetTransition -> DCPetriNetTransitionController.
			DCPetriNetPlace -> DCPetriNetPlaceController}