private-testing
canBeTargetFor
	^ super canBeSourceFor
		add: DCPetriNetNormalArcController;
		yourself