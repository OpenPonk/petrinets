"
A DCPetriNetArcControllerTest is an abstract test class for testing the behavior of classes from place to transition
"
Class {
	#name : 'OPPetriNetInputArcControllerTest',
	#superclass : 'OPPetriNetArcControllerTest',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'testing' }
OPPetriNetInputArcControllerTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self name = #OPPetriNetInputArcControllerTest
]

{ #category : 'hooks' }
OPPetriNetInputArcControllerTest >> fromClass [
	^ OPPetriNetPTPlaceController
]

{ #category : 'hooks' }
OPPetriNetInputArcControllerTest >> toClass [
	^ OPPetriNetTransitionController
]
