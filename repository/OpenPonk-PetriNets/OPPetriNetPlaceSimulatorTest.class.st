"
A DCPetriNetPlaceSimulatorTest is a test class for testing the behavior of DCPetriNetPlaceSimulator
"
Class {
	#name : #OPPetriNetPlaceSimulatorTest,
	#superclass : #OPPetriNetNodeSimulatorTest,
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetPlaceSimulatorTest >> controllerClass [
	^ OPPetriNetPlaceSimulator
]

{ #category : #hooks }
OPPetriNetPlaceSimulatorTest >> exampleModel [
	^ OPPetriNetPTPlace new
		name: 'P1';
		tokens: 20;
		yourself
]

{ #category : #tests }
OPPetriNetPlaceSimulatorTest >> testLoadingState [
	self assert: model tokens = 20.
	self assert: simulator tokensAmount = 20.
	simulator saveState.
	self assert: model tokens = 20.
	self assert: simulator tokensAmount = 20.


	simulator removeTokensAmount: 5.
	self assert: model tokens = 15.

	simulator tokensAmount: 0.
	self assert: model tokens = 0.

	simulator loadState.
	self assert: model tokens = 20.
	self assert: simulator tokensAmount = 20
]

{ #category : #tests }
OPPetriNetPlaceSimulatorTest >> testSteppable [
	self assert: simulator isSteppable not.
	self assert: simulator isSimulable not
]

{ #category : #tests }
OPPetriNetPlaceSimulatorTest >> testTokens [
	self assert: simulator tokenCount = 0.
	self assert: simulator tokensAmount = 20.
	simulator removeTokensAmount: 5.
	self assert: simulator tokensAmount = 15.
	simulator tokensAmount: 0.
	self assert: simulator tokensAmount = 0.
	simulator addTokensAmount: 5.
	self assert: simulator tokensAmount = 5
]
