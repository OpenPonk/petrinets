initialization
initializePalette: aPalette
	aPalette
		newCreationTool: 'Place' factory: [ DCPetriNetPlaceController new ] icon: DCPetriNetsIcons current placeIcon;
		newCreationTool: 'Transition'
			factory: [ DCPetriNetTransitionController new ]
			icon: DCPetriNetsIcons current transitionIcon;
		newSeparator;
		newConnectionCreationTool: 'Output Arc'
			factory: [ DCPetriNetOutputArcController new ]
			icon: DCPetriNetsIcons current arcIcon;
		newSeparator;
		newConnectionCreationTool: 'Normal Arc'
			factory: [ DCPetriNetNormalArcController new ]
			icon: DCPetriNetsIcons current arcIcon;
		newConnectionCreationTool: 'Inhibitor Arc'
			factory: [ DCPetriNetInhibitorArcController new ]
			icon: DCPetriNetsIcons current inhibitorArcIcon;
		newConnectionCreationTool: 'Reset Arc'
			factory: [ DCPetriNetResetArcController new ]
			icon: DCPetriNetsIcons current resetArcIcon