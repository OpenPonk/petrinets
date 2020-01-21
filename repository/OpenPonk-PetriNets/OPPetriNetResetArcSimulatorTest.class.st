"
A DCPetriNetResetArcSimulatorTest is a test class for testing the behavior of DCPetriNetResetArcSimulator
"
Class {
	#name : #OPPetriNetResetArcSimulatorTest,
	#superclass : #OPPetriNetInputArcSimulatorTest,
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetResetArcSimulatorTest >> controllerClass [
	^ OPPetriNetResetArcSimulator
]

{ #category : #hooks }
OPPetriNetResetArcSimulatorTest >> exampleModel [
	^ OPPetriNetResetArc new
]

{ #category : #tests }
OPPetriNetResetArcSimulatorTest >> testHandleFire [
	self assert: place tokensAmount = 10.
	simulator handleFire.
	self assert: place tokensAmount = 0
]

{ #category : #tests }
OPPetriNetResetArcSimulatorTest >> testIsEnabled [
	self assert: simulator isEnabled.
	place tokensAmount: 0.
	self assert: simulator isEnabled.
	place tokensAmount: 1000.
	self assert: simulator isEnabled
]
