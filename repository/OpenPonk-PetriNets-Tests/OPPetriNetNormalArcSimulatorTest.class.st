"
A DCPetriNetNormalArcSimulatorTest is a test class for testing the behavior of DCPetriNetNormalArcSimulator
"
Class {
	#name : 'OPPetriNetNormalArcSimulatorTest',
	#superclass : 'OPPetriNetInputArcSimulatorTest',
	#category : 'OpenPonk-PetriNets-Tests-Simulation',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Simulation'
}

{ #category : 'hooks' }
OPPetriNetNormalArcSimulatorTest >> exampleModel [
	^ OPPetriNetNormalArc new
		weight: 2;
		yourself
]

{ #category : 'hooks' }
OPPetriNetNormalArcSimulatorTest >> simulatorClass [

	^ OPPetriNetNormalArcSimulator
]

{ #category : 'tests' }
OPPetriNetNormalArcSimulatorTest >> testHandleFire [

	self assert: place petriNetTokens equals: 10.
	simulator handleFire.
	self assert: place petriNetTokens equals: 8
]

{ #category : 'tests' }
OPPetriNetNormalArcSimulatorTest >> testIsEnabled [

	self assert: simulator isEnabled description: 'Normal arc with weight 2 must be enabled when source place has 10 tokens'.
	place petriNetTokens: 0.
	self deny: simulator isEnabled description: 'Normal arc with weight 2 must be disabled when source place has 0 tokens'.
	place petriNetTokens: 1000.
	self assert: simulator isEnabled description: 'Normal arc with weight 2 must be enabled when source place has 1000 tokens'
]
