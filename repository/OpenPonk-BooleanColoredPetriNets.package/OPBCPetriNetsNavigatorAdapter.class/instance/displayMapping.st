widget API
displayMapping
	^ {(OPBCPetriNet -> 'Diagram').
	(OPPetriNetArcWithExpression -> 'Arc').
	(OPPetriNetPlaceWithBooleanToken -> 'Place').
	(OPPetriNetTransition -> 'Transition')}