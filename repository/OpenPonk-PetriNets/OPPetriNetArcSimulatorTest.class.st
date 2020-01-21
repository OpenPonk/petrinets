"
A DCPetriNetArcSimulatorTest is a test class for testing the behavior of DCPetriNetArcSimulator
"
Class {
	#name : #OPPetriNetArcSimulatorTest,
	#superclass : #TestCase,
	#instVars : [
		'simulator',
		'place',
		'trans',
		'model'
	],
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #testing }
OPPetriNetArcSimulatorTest class >> isAbstract [
	^ self == OPPetriNetArcSimulatorTest
]

{ #category : #hooks }
OPPetriNetArcSimulatorTest >> controllerClass [
	^ self subclassResponsibility
]

{ #category : #hooks }
OPPetriNetArcSimulatorTest >> exampleModel [
	^ self subclassResponsibility
]

{ #category : #running }
OPPetriNetArcSimulatorTest >> setUp [
	super setUp.
	model := self exampleModel.
	simulator := self controllerClass model: model.
	place := OPPetriNetPlaceSimulator model: (OPPetriNetPTPlace new tokens: 10).
	trans := OPPetriNetTransitionSimulator model: OPPetriNetTransition new
]
