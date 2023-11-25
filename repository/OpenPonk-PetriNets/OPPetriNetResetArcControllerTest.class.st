"
A DCPetriNetResetArcControllerTest is a test class for testing the behavior of DCPetriNetResetArcController
"
Class {
	#name : #OPPetriNetResetArcControllerTest,
	#superclass : #OPPetriNetInputArcControllerTest,
	#category : #'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetResetArcControllerTest >> controllerClass [
	^ OPPetriNetResetArcController
]

{ #category : #construction }
OPPetriNetResetArcControllerTest >> diagramElementClass [

	^ OPPetriNetResetArcShape
]

{ #category : #hooks }
OPPetriNetResetArcControllerTest >> modelClass [
	^ OPPetriNetResetArc
]
