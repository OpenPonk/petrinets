"
A DCPetriNetInhibitorArcControllerTest is a test class for testing the behavior of DCPetriNetInhibitorArcController
"
Class {
	#name : #OPPetriNetInhibitorArcControllerTest,
	#superclass : #OPPetriNetInputArcControllerTest,
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetInhibitorArcControllerTest >> controllerClass [
	^ OPPetriNetInhibitorArcController
]

{ #category : #hooks }
OPPetriNetInhibitorArcControllerTest >> desiredHeadShape [
	^ RTEmptyCircle
]

{ #category : #hooks }
OPPetriNetInhibitorArcControllerTest >> modelClass [
	^ OPPetriNetInhibitorArc
]
