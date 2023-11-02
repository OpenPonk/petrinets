"
A DCPetriNetNormalArcSimulatorTest is a test class for testing the behavior of DCPetriNetNormalArcSimulator
"
Class {
	#name : #OPPetriNetNormalArcSimulatorTest,
	#superclass : #OPPetriNetInputArcSimulatorTest,
	#category : #'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetNormalArcSimulatorTest >> controllerClass [
	^ OPPetriNetNormalArcSimulator
		model:
			(OPPetriNetNormalArc new
				weight: 2;
				yourself)
]

{ #category : #hooks }
OPPetriNetNormalArcSimulatorTest >> exampleModel [
	^ OPPetriNetNormalArc new
		weight: 2;
		yourself
]

{ #category : #tests }
OPPetriNetNormalArcSimulatorTest >> testHandleFire [

	self assert: place petriNetTokens equals: 10.
	simulator handleFire.
	self assert: place petriNetTokens equals: 8
]

{ #category : #tests }
OPPetriNetNormalArcSimulatorTest >> testIsEnabled [
	self assert: simulator isEnabled.
	place petriNetTokens: 0.
	self assert: simulator isEnabled not.
	place petriNetTokens: 1000.
	self assert: simulator isEnabled
]
