"
A DCPetriNetResetArcControllerTest is a test class for testing the behavior of DCPetriNetResetArcController
"
Class {
	#name : 'OPPetriNetResetArcControllerTest',
	#superclass : 'OPPetriNetInputArcControllerTest',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPPetriNetResetArcControllerTest class >> diagramElementClass [

	^ OPPetriNetResetArcShape
]

{ #category : 'constants' }
OPPetriNetResetArcControllerTest >> controllerClass [
	^ OPPetriNetResetArcController
]

{ #category : 'constants' }
OPPetriNetResetArcControllerTest >> modelClass [
	^ OPPetriNetResetArc
]
