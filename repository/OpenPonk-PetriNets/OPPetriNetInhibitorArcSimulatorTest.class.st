"
A DCPetriNetInhibitorArcSimulatorTest is a test class for testing the behavior of DCPetriNetInhibitorArcSimulator
"
Class {
	#name : #OPPetriNetInhibitorArcSimulatorTest,
	#superclass : #OPPetriNetInputArcSimulatorTest,
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetInhibitorArcSimulatorTest >> controllerClass [
	^ OPPetriNetInhibitorArcSimulator
]

{ #category : #hooks }
OPPetriNetInhibitorArcSimulatorTest >> exampleModel [
	^ OPPetriNetInhibitorArc new
]

{ #category : #tests }
OPPetriNetInhibitorArcSimulatorTest >> testHandleFire [
	self assert: place tokensAmount = 10.
	simulator handleFire.
	self assert: place tokensAmount = 10
]

{ #category : #tests }
OPPetriNetInhibitorArcSimulatorTest >> testIsEnabled [
	self assert: simulator isEnabled not.
	place tokensAmount: 0.
	self assert: simulator isEnabled.
	place tokensAmount: 1000.
	self assert: simulator isEnabled not
]
