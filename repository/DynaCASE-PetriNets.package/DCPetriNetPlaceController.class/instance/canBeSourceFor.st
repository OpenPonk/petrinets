private-testing
canBeSourceFor
	^ super canBeSourceFor
		add: DCPetriNetArcController;
		yourself