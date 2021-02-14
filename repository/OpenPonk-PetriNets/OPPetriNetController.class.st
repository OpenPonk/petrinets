Class {
	#name : #OPPetriNetController,
	#superclass : #OPDiagramController,
	#category : #'OpenPonk-PetriNets-Controllers'
}

{ #category : #testing }
OPPetriNetController >> canBeTargetFor: aController [
	^ (super canBeTargetFor: aController)
		or: [ aController isKindOf: OPPetriNetNodeController ]
]

{ #category : #'as yet unclassified' }
OPPetriNetController >> commonModelClassPrefix [
	^ 'OPPetriNet'
]

{ #category : #accessing }
OPPetriNetController >> controllerFactory [
	^ super controllerFactory
		register: OPPetriNetInhibitorArcController
			forModel: OPPetriNetInhibitorArc;
		register: OPPetriNetResetArcController forModel: OPPetriNetResetArc;
		register: OPPetriNetNormalArcController
			forModel: OPPetriNetNormalArc;
		register: OPPetriNetTransitionController
			forModel: OPPetriNetTransition;
		register: OPPetriNetPTPlaceController forModel: OPPetriNetPTPlace
]

{ #category : #accessing }
OPPetriNetController >> elementsToShowInside [
	^ model elements
]

{ #category : #initialization }
OPPetriNetController >> initializePalette: aPalette [
	aPalette
		newCreationTool: 'Place' factory: [ OPPetriNetPTPlaceController new ] icon: OPPetriNetsIcons current placeIcon;
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
]

{ #category : #accessing }
OPPetriNetController >> modelClass [
	^ OPPetriNet
]
