accessing
modelToControllerMapping
	^ Dictionary
		newFrom:
			{(OPPetriNetArcWithExpression -> OPPetriNetArcWithExpressionController).
			(OPPetriNetTransition -> OPBCPetriNetTransitionController).
			(OPPetriNetPlaceWithBooleanToken -> OPPetriNetPlaceWithBooleanController)}