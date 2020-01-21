"
A DCPetriNetSimulatorTest is a test class for testing the behavior of DCPetriNetSimulator
"
Class {
	#name : #OPPetriNetSimulatorTest,
	#superclass : #TestCase,
	#instVars : [
		'simulator'
	],
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetSimulatorTest >> controllerClass [
	^ OPPetriNetSimulator
]

{ #category : #hooks }
OPPetriNetSimulatorTest >> exampleModel [
	| model place1 arc1 arc2 arc3 arc4 place2 place3 place4 trans1 trans2 arc5 |
	model := OPPetriNet new name: 'Petri Net Diagram'.
	place1 := OPPetriNetPTPlace new
		name: 'P1';
		tokens: 20;
		yourself.
	place2 := OPPetriNetPTPlace new
		name: 'P2';
		yourself.
	place3 := OPPetriNetPTPlace new
		name: 'P3';
		yourself.
	place4 := OPPetriNetPTPlace new
		name: 'P4';
		tokens: 1;
		yourself.
	trans1 := OPPetriNetTransition new
		name: 'T1';
		yourself.
	trans2 := OPPetriNetTransition new
		name: 'T2';
		yourself.
	model
		add: place1;
		add: place2;
		add: place3;
		add: place4;
		add: trans1;
		add: trans2.
	arc1 := OPPetriNetNormalArc from: place1 to: trans1.
	arc2 := OPPetriNetInhibitorArc from: place2 to: trans1.
	arc3 := OPPetriNetNormalArc from: trans1 to: place3.
	arc4 := OPPetriNetResetArc from: place4 to: trans1.
	arc5 := OPPetriNetNormalArc from: trans2 to: place4.
	model
		add: arc1;
		add: arc2;
		add: arc3;
		add: arc4;
		add: arc5.
	^ model
]

{ #category : #running }
OPPetriNetSimulatorTest >> setUp [
	simulator := self controllerClass model: self exampleModel
]

{ #category : #tests }
OPPetriNetSimulatorTest >> testDefaultStepping [
	| items item stepped didAction |
	simulator setDefaultStepping.

	items := simulator itemsForAction.
	self assert: items size = 1.
	item := items first.
	self assert: item isSimulable.
	self assert: item isSteppable.
	self assert: (item isKindOf: OPPetriNetTransitionSimulator).

	stepped := OrderedCollection new.
	didAction := OrderedCollection new.
	simulator simulableElementsDo: [ :each | each when: OPSimulatorStepped do: [ :event | stepped add: event ] ].
	simulator simulableElementsDo: [ :each | each when: OPSimulatorDidAction do: [ :event | didAction add: event ] ].
	simulator step.
	self assert: stepped size = 1.
	self assert: didAction size = 2
]

{ #category : #tests }
OPPetriNetSimulatorTest >> testSteppingAll [
	| items stepped didAction |
	simulator setSteppingAll.
	
	items := simulator itemsForAction.
	self assert: items size = 2.
	self assert: (items allSatisfy: [ :item | item isSimulable ]).
	self assert: (items allSatisfy: [ :item | item isSteppable ]).
	self assert: (items allSatisfy: [ :item | item isKindOf: OPPetriNetTransitionSimulator ]).

	stepped := OrderedCollection new.
	didAction := OrderedCollection new.
	items do: [ :item | item when: OPSimulatorStepped do: [ :event | stepped add: event ] ].
	items do: [ :item | item when: OPSimulatorDidAction do: [ :event | didAction add: event ] ].
	simulator step.
	self assert: stepped size = 2.
	self assert: didAction size = 4
]
