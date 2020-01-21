"
A DCPetriNetTransitionSimulatorTest is a test class for testing the behavior of DCPetriNetTransitionSimulator
"
Class {
	#name : #OPPetriNetTransitionSimulatorTest,
	#superclass : #OPPetriNetNodeSimulatorTest,
	#instVars : [
		'inc',
		'out'
	],
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetTransitionSimulatorTest >> controllerClass [
	^ OPPetriNetTransitionSimulator
]

{ #category : #hooks }
OPPetriNetTransitionSimulatorTest >> exampleModel [
	^ OPPetriNetTransition new
		name: 'T1';
		yourself
]

{ #category : #running }
OPPetriNetTransitionSimulatorTest >> setUp [
	super setUp.

	inc := OPPetriNetPlaceSimulator
		model:
			(OPPetriNetPTPlace new
				tokens: 4;
				yourself).
	(OPPetriNetNormalArcSimulator model: OPPetriNetNormalArc new)
		source: inc;
		target: simulator;
		yourself.

	out := OPPetriNetPlaceSimulator
		model:
			(OPPetriNetPTPlace new
				tokens: 4;
				yourself).
	(OPPetriNetNormalArcSimulator model: OPPetriNetNormalArc new)
		target: out;
		source: simulator;
		yourself
]

{ #category : #tests }
OPPetriNetTransitionSimulatorTest >> testFiring [
	self assert: inc tokensAmount = 4.
	self assert: out tokensAmount = 4.
	simulator fireIncoming.
	self assert: inc tokensAmount = 3.
	self assert: out tokensAmount = 4.
	simulator fireOutgoing.
	self assert: inc tokensAmount = 3.
	self assert: out tokensAmount = 5.
	simulator doAction: 1.
	self assert: inc tokensAmount = 2.
	self assert: out tokensAmount = 5.
	simulator doAction: 2.
	self assert: inc tokensAmount = 2.
	self assert: out tokensAmount = 6.
	simulator step.
	self assert: inc tokensAmount = 1.
	self assert: out tokensAmount = 7
]

{ #category : #tests }
OPPetriNetTransitionSimulatorTest >> testSteppable [
	self assert: simulator isSimulable.
	self assert: simulator isSteppable.
	self assert: simulator isEnabled
]
