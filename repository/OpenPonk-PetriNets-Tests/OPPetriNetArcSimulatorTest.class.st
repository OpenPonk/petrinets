"
Abstract base class for unit tests verifying the behavior of Petri Net arc simulators.
"
Class {
	#name : 'OPPetriNetArcSimulatorTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulator',
		'place',
		'trans',
		'model'
	],
	#category : 'OpenPonk-PetriNets-Tests-Simulation',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Simulation'
}

{ #category : 'testing' }
OPPetriNetArcSimulatorTest class >> isAbstract [
	^ self == OPPetriNetArcSimulatorTest
]

{ #category : 'hooks' }
OPPetriNetArcSimulatorTest >> exampleModel [
	^ self subclassResponsibility
]

{ #category : 'running' }
OPPetriNetArcSimulatorTest >> setUp [

	super setUp.
	model := self exampleModel.
	simulator := self simulatorClass model: model.
	place := OPPetriNetPlaceSimulator model:
		         (OPPetriNetPTPlace new tokens: 10).
	trans := OPPetriNetTransitionSimulator model:
		         OPPetriNetTransition new
]

{ #category : 'hooks' }
OPPetriNetArcSimulatorTest >> simulatorClass [
	^ self subclassResponsibility
]

{ #category : 'tests' }
OPPetriNetArcSimulatorTest >> testIsNotSteppableAndNotSimulable [

	self deny: simulator isSteppable description: 'Arc simulator must not be steppable'.
	self deny: simulator isSimulable description: 'Arc simulator must not be simulable'
]
