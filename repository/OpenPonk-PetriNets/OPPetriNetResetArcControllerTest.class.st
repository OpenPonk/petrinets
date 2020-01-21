"
A DCPetriNetResetArcControllerTest is a test class for testing the behavior of DCPetriNetResetArcController
"
Class {
	#name : #OPPetriNetResetArcControllerTest,
	#superclass : #OPPetriNetInputArcControllerTest,
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetResetArcControllerTest >> controllerClass [
	^ OPPetriNetResetArcController
]

{ #category : #hooks }
OPPetriNetResetArcControllerTest >> desiredHeadShape [
	^ OPRTEmptyDoubleArrow

]

{ #category : #hooks }
OPPetriNetResetArcControllerTest >> modelClass [
	^ OPPetriNetResetArc
]
