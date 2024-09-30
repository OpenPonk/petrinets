"
A DCPetriNetResetArcSimulatorTest is a test class for testing the behavior of DCPetriNetResetArcSimulator
"
Class {
	#name : 'OPPetriNetResetArcSimulatorTest',
	#superclass : 'OPPetriNetInputArcSimulatorTest',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPPetriNetResetArcSimulatorTest >> controllerClass [
	^ OPPetriNetResetArcSimulator
]

{ #category : 'hooks' }
OPPetriNetResetArcSimulatorTest >> exampleModel [
	^ OPPetriNetResetArc new
]

{ #category : 'tests' }
OPPetriNetResetArcSimulatorTest >> testHandleFire [

	self assert: place petriNetTokens equals: 10.
	simulator handleFire.
	self assert: place petriNetTokens equals: 0
]

{ #category : 'tests' }
OPPetriNetResetArcSimulatorTest >> testIsEnabled [
	self assert: simulator isEnabled.
	place petriNetTokens: 0.
	self assert: simulator isEnabled.
	place petriNetTokens: 1000.
	self assert: simulator isEnabled
]
