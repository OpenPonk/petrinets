"
A DCPetriNetArcControllerTest is an abstract test class for testing the behavior of classes from place to transition
"
Class {
	#name : 'OPPetriNetInputArcControllerTest',
	#superclass : 'OPPetriNetArcControllerTest',
	#category : 'OpenPonk-PetriNets-Tests-Controllers',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Controllers'
}

{ #category : 'testing' }
OPPetriNetInputArcControllerTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self name = #OPPetriNetInputArcControllerTest
]

{ #category : 'constants' }
OPPetriNetInputArcControllerTest >> sourceControllerClass [

	^ OPPetriNetPTPlaceController
]

{ #category : 'constants' }
OPPetriNetInputArcControllerTest >> sourceModelClass [

	^ OPPetriNetPTPlace
]

{ #category : 'constants' }
OPPetriNetInputArcControllerTest >> targetControllerClass [

	^ OPPetriNetTransitionController
]

{ #category : 'constants' }
OPPetriNetInputArcControllerTest >> targetModelClass [

	^ OPPetriNetTransition
]
