initialization
initializePalette: aPalette
	aPalette
		newCreationTool: 'Place' factory: [ DCPetriNetPlaceController new ];
		newCreationTool: 'Transition' factory: [ DCPetriNetTransitionController new ];
		newSeparator;
		newConnectionCreationTool: 'Normal Arc' factory: [ DCPetriNetNormalArcController new ];
		newConnectionCreationTool: 'Inhibitor Arc' factory: [ DCPetriNetInhibitorArcController new ]