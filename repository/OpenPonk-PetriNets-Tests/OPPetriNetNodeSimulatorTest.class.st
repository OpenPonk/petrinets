"
Abstract base class for unit tests verifying the behavior of Petri Net node simulators.
"
Class {
	#name : 'OPPetriNetNodeSimulatorTest',
	#superclass : 'TestCase',
	#instVars : [
		'model',
		'simulator'
	],
	#category : 'OpenPonk-PetriNets-Tests-Simulation',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Simulation'
}

{ #category : 'testing' }
OPPetriNetNodeSimulatorTest class >> isAbstract [
	^ self == OPPetriNetNodeSimulatorTest
]

{ #category : 'hooks' }
OPPetriNetNodeSimulatorTest >> exampleModel [
	^ self subclassResponsibility
]

{ #category : 'running' }
OPPetriNetNodeSimulatorTest >> setUp [
	super setUp.
	model := self exampleModel.
	simulator := self simulatorClass model: model
]

{ #category : 'hooks' }
OPPetriNetNodeSimulatorTest >> simulatorClass [
	^ self subclassResponsibility
]
