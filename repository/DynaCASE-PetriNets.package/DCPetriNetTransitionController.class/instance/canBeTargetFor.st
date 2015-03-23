private-testing
canBeTargetFor
	^ super canBeSourceFor
		add: DCPetriNetArcController;
		yourself