"
A DCPetriNetPlaceSimulatorTest is a test class for testing the behavior of DCPetriNetPlaceSimulator
"
Class {
	#name : 'OPPetriNetPlaceSimulatorTest',
	#superclass : 'OPPetriNetNodeSimulatorTest',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPPetriNetPlaceSimulatorTest >> controllerClass [
	^ OPPetriNetPlaceSimulator
]

{ #category : 'hooks' }
OPPetriNetPlaceSimulatorTest >> exampleModel [
	^ OPPetriNetPTPlace new
		name: 'P1';
		tokens: 20;
		yourself
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
	self assert: simulator isSteppable not.
	self assert: simulator isSimulable not
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
