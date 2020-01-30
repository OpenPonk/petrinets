Class {
	#name : #OPPetriNetController,
	#superclass : #OPDiagramController,
	#category : #'OpenPonk-PetriNets-Controllers'
}

{ #category : #testing }
OPPetriNetController >> canBeTargetFor: aController [
	^ aController isKindOf: OPPetriNetNodeController
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

{ #category : #accessing }
OPPetriNetController >> modelToControllerMapping [
	^ Dictionary
		newFrom:
			{OPPetriNetInhibitorArc -> OPPetriNetInhibitorArcController.
			OPPetriNetResetArc -> OPPetriNetResetArcController.
			OPPetriNetNormalArc -> OPPetriNetNormalArcController.
			OPPetriNetTransition -> OPPetriNetTransitionController.
			OPPetriNetPTPlace -> OPPetriNetPTPlaceController}
]
