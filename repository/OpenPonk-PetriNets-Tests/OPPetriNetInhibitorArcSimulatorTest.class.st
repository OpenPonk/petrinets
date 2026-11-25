"
A DCPetriNetInhibitorArcSimulatorTest is a test class for testing the behavior of DCPetriNetInhibitorArcSimulator
"
Class {
	#name : 'OPPetriNetInhibitorArcSimulatorTest',
	#superclass : 'OPPetriNetInputArcSimulatorTest',
	#category : 'OpenPonk-PetriNets-Tests-Simulation',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Simulation'
}

{ #category : 'hooks' }
OPPetriNetInhibitorArcSimulatorTest >> exampleModel [
	^ OPPetriNetInhibitorArc new
]

{ #category : 'hooks' }
OPPetriNetInhibitorArcSimulatorTest >> simulatorClass [
	^ OPPetriNetInhibitorArcSimulator
]

{ #category : 'tests' }
OPPetriNetInhibitorArcSimulatorTest >> testHandleFire [

	self assert: place petriNetTokens equals: 10.
	simulator handleFire.
	self assert: place petriNetTokens equals: 10
]

{ #category : 'tests' }
OPPetriNetInhibitorArcSimulatorTest >> testIsEnabled [

	self deny: simulator isEnabled description: 'Inhibitor arc must be disabled when source place has 10 tokens'.
	place petriNetTokens: 0.
	self assert: simulator isEnabled description: 'Inhibitor arc must be enabled when source place has 0 tokens'.
	place petriNetTokens: 1000.
	self deny: simulator isEnabled description: 'Inhibitor arc must be disabled when source place has 1000 tokens'
]
