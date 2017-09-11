accessing
modelToControllerMapping
	^ Dictionary
		newFrom:
			{OPPetriNetInhibitorArc -> OPPetriNetInhibitorArcController.
			OPPetriNetResetArc -> OPPetriNetResetArcController.
			OPPetriNetNormalArc -> OPPetriNetNormalArcController.
			OPPetriNetTransition -> OPPetriNetTransitionController.
			OPPetriNetPlaceWithTokens -> OPPetriNetPlaceWithTokensController}