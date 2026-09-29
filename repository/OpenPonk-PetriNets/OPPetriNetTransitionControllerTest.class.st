"
A DCPetriNetTransitionControllerTest is a test class for testing the behavior of DCPetriNetTransitionController
"
Class {
	#name : 'OPPetriNetTransitionControllerTest',
	#superclass : 'OPPetriNetNodeControllerTest',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPPetriNetTransitionControllerTest class >> diagramElementClass [

	^ OPPetriNetTransitionShape
]

{ #category : 'constants' }
OPPetriNetTransitionControllerTest >> controllerClass [
	^ OPPetriNetTransitionController
]

{ #category : 'constants' }
OPPetriNetTransitionControllerTest >> modelClass [
	^ OPPetriNetTransition
]
