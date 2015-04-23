initialization
initializePalette: aPalette
	aPalette
		newCreationTool: 'Place' factory: [ DCPetriNetPlaceController new ];
		newCreationTool: 'Transition' factory: [ DCPetriNetTransitionController new ];
		newSeparator;
		newConnectionCreationTool: 'Output Arc' factory: [ DCPetriNetOutputArcController new ];
		newConnectionCreationTool: 'Normal Arc' factory: [ DCPetriNetNormalArcController new ];
		newConnectionCreationTool: 'Inhibitor Arc' factory: [ DCPetriNetInhibitorArcController new ];
		newConnectionCreationTool: 'Reset Arc' factory: [ DCPetriNetResetArcController new ]