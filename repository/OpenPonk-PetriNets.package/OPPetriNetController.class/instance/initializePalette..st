initialization
initializePalette: aPalette
	aPalette
		newCreationTool: 'Place' factory: [ OPPetriNetPlaceWithTokensController new ] icon: OPPetriNetsIcons current placeIcon;
		newCreationTool: 'Transition'
			factory: [ OPPetriNetTransitionController new ]
			icon: OPPetriNetsIcons current transitionIcon;
		newSeparator;
		newConnectionCreationTool: 'Arc'
			factory: [ OPPetriNetNormalArcController new ]
			icon: OPPetriNetsIcons current arcIcon;
		newConnectionCreationTool: 'Inhibitor Arc'
			factory: [ OPPetriNetInhibitorArcController new ]
			icon: OPPetriNetsIcons current inhibitorArcIcon;
		newConnectionCreationTool: 'Reset Arc'
			factory: [ OPPetriNetResetArcController new ]
			icon: OPPetriNetsIcons current resetArcIcon