"
A DCPetriNetInputArcSimulatorTest is a test class for testing the behavior of DCPetriNetInputArcSimulator
"
Class {
	#name : 'OPPetriNetInputArcSimulatorTest',
	#superclass : 'OPPetriNetArcSimulatorTest',
	#category : 'OpenPonk-PetriNets-Tests-Simulation',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Simulation'
}

{ #category : 'testing' }
OPPetriNetInputArcSimulatorTest class >> isAbstract [
	^ self == OPPetriNetInputArcSimulatorTest
]

{ #category : 'running' }
OPPetriNetInputArcSimulatorTest >> setUp [
	super setUp.
	simulator
		source: place;
		target: trans
]
