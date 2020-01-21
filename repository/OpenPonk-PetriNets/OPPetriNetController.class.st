Class {
	#name : #OPPetriNetController,
	#superclass : #OPDiagramController,
	#category : 'OpenPonk-PetriNets-Controllers'
}

{ #category : #userinterface }
OPPetriNetController >> applyDefaultLayout [
	RTTreeLayout new
		doNotAttachPoint;
		on: self view elements.
	self updateView.
	self view canvas camera focusOnCenter
]

{ #category : #testing }
OPPetriNetController >> canBeTargetFor: aController [
	^ aController isKindOf: OPPetriNetNodeController
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

{ #category : #rebuilding }
OPPetriNetController >> rebuild [
	super rebuild.
	self applyDefaultLayout
]

{ #category : #rebuilding }
OPPetriNetController >> showAllElements [
	model nodes , model arcs do: [ :each | self showModelInDiagram: each ]
]
