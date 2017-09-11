initialization
initializePalette: aPalette
	aPalette
		newCreationTool: 'Place'
			factory: [ OPPetriNetPlaceWithBooleanController new ]
			icon: OPPetriNetsIcons current placeIcon;
		newCreationTool: 'Transition'
			factory: [ OPBCPetriNetTransitionController new ]
			icon: OPPetriNetsIcons current transitionIcon;
		newSeparator;
		newConnectionCreationTool: 'Arc'
			factory: [ OPPetriNetArcWithExpressionController new ]
			icon: OPPetriNetsIcons current arcIcon