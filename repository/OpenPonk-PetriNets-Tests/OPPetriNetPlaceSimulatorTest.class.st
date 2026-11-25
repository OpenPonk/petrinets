"
A DCPetriNetPlaceSimulatorTest is a test class for testing the behavior of DCPetriNetPlaceSimulator
"
Class {
	#name : 'OPPetriNetPlaceSimulatorTest',
	#superclass : 'OPPetriNetNodeSimulatorTest',
	#category : 'OpenPonk-PetriNets-Tests-Simulation',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Simulation'
}

{ #category : 'hooks' }
OPPetriNetPlaceSimulatorTest >> exampleModel [
	^ OPPetriNetPTPlace new
		name: 'P1';
		tokens: 20;
		yourself
]

{ #category : 'hooks' }
OPPetriNetPlaceSimulatorTest >> simulatorClass [
	^ OPPetriNetPlaceSimulator
]

{ #category : 'tests' }
OPPetriNetPlaceSimulatorTest >> testLoadingState [

	self assert: model tokens equals: 20.
	self assert: simulator petriNetTokens equals: 20.
	simulator saveState.
	self assert: model tokens equals: 20.
	self assert: simulator petriNetTokens equals: 20.


	simulator removePetriNetTokens: 5.
	self assert: model tokens equals: 15.

	simulator petriNetTokens: 0.
	self assert: model tokens equals: 0.

	simulator loadState.
	self assert: model tokens equals: 20.
	self assert: simulator petriNetTokens equals: 20
]

{ #category : 'tests' }
OPPetriNetPlaceSimulatorTest >> testSteppable [

	self deny: simulator isSteppable description: 'Place simulator must not be steppable'.
	self deny: simulator isSimulable description: 'Place simulator must not be simulable'
]

{ #category : 'tests' }
OPPetriNetPlaceSimulatorTest >> testTokens [

	self assert: simulator tokenCount equals: 0.
	self assert: simulator petriNetTokens equals: 20.
	simulator removePetriNetTokens: 5.
	self assert: simulator petriNetTokens equals: 15.
	simulator petriNetTokens: 0.
	self assert: simulator petriNetTokens equals: 0.
	simulator addPetriNetTokens: 5.
	self assert: simulator petriNetTokens equals: 5
]
