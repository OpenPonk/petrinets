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

{ #category : 'hooks' }
OPPetriNetTransitionControllerTest >> controllerClass [
	^ OPPetriNetTransitionController
]

{ #category : 'construction' }
OPPetriNetTransitionControllerTest >> diagramElementClass [

	^ OPPetriNetTransitionShape
]

{ #category : 'hooks' }
OPPetriNetTransitionControllerTest >> modelClass [
	^ OPPetriNetTransition
]
