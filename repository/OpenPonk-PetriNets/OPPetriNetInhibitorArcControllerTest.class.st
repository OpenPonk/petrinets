"
A DCPetriNetInhibitorArcControllerTest is a test class for testing the behavior of DCPetriNetInhibitorArcController
"
Class {
	#name : 'OPPetriNetInhibitorArcControllerTest',
	#superclass : 'OPPetriNetInputArcControllerTest',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPPetriNetInhibitorArcControllerTest class >> diagramElementClass [

	^ OPPetriNetInhibitorArcShape
]

{ #category : 'constants' }
OPPetriNetInhibitorArcControllerTest >> controllerClass [
	^ OPPetriNetInhibitorArcController
]

{ #category : 'constants' }
OPPetriNetInhibitorArcControllerTest >> modelClass [
	^ OPPetriNetInhibitorArc
]
