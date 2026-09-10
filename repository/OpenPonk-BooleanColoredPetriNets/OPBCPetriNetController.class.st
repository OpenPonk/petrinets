Class {
	#name : 'OPBCPetriNetController',
	#superclass : 'OPPetriNetController',
	#category : 'OpenPonk-BooleanColoredPetriNets-Controllers',
	#package : 'OpenPonk-BooleanColoredPetriNets',
	#tag : 'Controllers'
}

{ #category : 'initialization' }
OPBCPetriNetController >> initializePalette: aPalette [

	aPalette
		newCreationTool: 'Place'
		factory: [ OPPetriNetPlaceWithBooleanController new ]
		icon: OPPetriNetsIcons placeIcon;
		newCreationTool: 'Transition'
		factory: [ OPBCPetriNetTransitionController new ]
		icon: OPPetriNetsIcons transitionIcon;
		newSeparator;
		newConnectionCreationTool: 'Arc'
		factory: [ OPPetriNetArcWithExpressionController new ]
		icon: OPPetriNetsIcons arcIcon
]

{ #category : 'accessing' }
OPBCPetriNetController >> modelClass [
	^ OPBCPetriNet
]

{ #category : 'accessing' }
OPBCPetriNetController >> modelToControllerMapping [
	^ Dictionary
		newFrom:
			{(OPPetriNetArcWithExpression -> OPPetriNetArcWithExpressionController).
			(OPPetriNetTransition -> OPBCPetriNetTransitionController).
			(OPPetriNetPlaceWithBooleanToken -> OPPetriNetPlaceWithBooleanController)}
]
