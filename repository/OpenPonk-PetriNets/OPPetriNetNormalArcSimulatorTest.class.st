"
A DCPetriNetNormalArcSimulatorTest is a test class for testing the behavior of DCPetriNetNormalArcSimulator
"
Class {
	#name : #OPPetriNetNormalArcSimulatorTest,
	#superclass : #OPPetriNetInputArcSimulatorTest,
	#category : 'OpenPonk-PetriNets-Tests'
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
	self assert: place tokensAmount = 10.
	simulator handleFire.
	self assert: place tokensAmount = 8
]

{ #category : #tests }
OPPetriNetNormalArcSimulatorTest >> testIsEnabled [
	self assert: simulator isEnabled.
	place tokensAmount: 0.
	self assert: simulator isEnabled not.
	place tokensAmount: 1000.
	self assert: simulator isEnabled
]
