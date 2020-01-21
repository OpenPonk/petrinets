"
A DCPetriNetTransitionControllerTest is a test class for testing the behavior of DCPetriNetTransitionController
"
Class {
	#name : #OPPetriNetTransitionControllerTest,
	#superclass : #OPPetriNetNodeControllerTest,
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetTransitionControllerTest >> controllerClass [
	^ OPPetriNetTransitionController
]

{ #category : #hooks }
OPPetriNetTransitionControllerTest >> modelClass [
	^ OPPetriNetTransition
]
