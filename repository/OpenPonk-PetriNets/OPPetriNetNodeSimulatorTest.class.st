"
A DCPetriNetNodeSimulatorTest is a test class for testing the behavior of DCPetriNetNodeSimulator
"
Class {
	#name : 'OPPetriNetNodeSimulatorTest',
	#superclass : 'TestCase',
	#instVars : [
		'model',
		'simulator'
	],
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'testing' }
OPPetriNetNodeSimulatorTest class >> isAbstract [
	^ self == OPPetriNetNodeSimulatorTest
]

{ #category : 'hooks' }
OPPetriNetNodeSimulatorTest >> controllerClass [
	^ self subclassResponsibility
]

{ #category : 'hooks' }
OPPetriNetNodeSimulatorTest >> exampleModel [
	^ self subclassResponsibility
]

{ #category : 'running' }
OPPetriNetNodeSimulatorTest >> setUp [
	super setUp.
	model := self exampleModel.
	simulator := self controllerClass model: model
]
