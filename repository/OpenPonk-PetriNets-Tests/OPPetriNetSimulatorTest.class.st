"
Unit tests for OPPetriNetSimulator.
Verifies stepping, execution flow, and overall simulation behavior for Petri Net diagrams.
"
Class {
	#name : 'OPPetriNetSimulatorTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulator'
	],
	#category : 'OpenPonk-PetriNets-Tests-Simulation',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Simulation'
}

{ #category : 'hooks' }
OPPetriNetSimulatorTest >> controllerClass [
	^ OPPetriNetSimulator
]

{ #category : 'hooks' }
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

{ #category : 'running' }
OPPetriNetSimulatorTest >> setUp [

	super setUp.

	simulator := self controllerClass model: self exampleModel
]

{ #category : 'tests' }
OPPetriNetSimulatorTest >> testDefaultStepping [

	| items item steppableBeforeStep stepped didAction steppedSimulator |
	simulator setDefaultStepping.

	items := simulator itemsForAction.
	self assert: items size equals: 1.
	item := items first.
	self assert: item class identicalTo: OPPetriNetTransitionSimulator.
	self assert: item model class identicalTo: OPPetriNetTransition.
	self assertCollection: #( 'T1' 'T2' ) includesAll: { item model name }.
	self assert: item isSimulable description: 'Selected Petri net transition simulator must be simulable'.
	self assert: item isSteppable description: 'Selected Petri net transition simulator must be steppable'.

	steppableBeforeStep := simulator steppableElements.
	stepped := OrderedCollection new.
	didAction := OrderedCollection new.
	simulator simulableElementsDo: [ :each | each when: OPSimulatorStepped do: [ :event | stepped add: event ] for: self ].
	simulator simulableElementsDo: [ :each | each when: OPSimulatorDidAction do: [ :event | didAction add: event ] for: self ].
	simulator step.
	self assert: stepped size equals: 1.
	steppedSimulator := stepped first simulator.
	self assertCollection: steppableBeforeStep includesAll: { steppedSimulator }.
	self assert: didAction size equals: 2.
	self assert: (didAction collect: #index as: Array) equals: #( 1 2 ).
	self assert: (didAction collect: #simulator as: Array) equals: {
			steppedSimulator.
			steppedSimulator }
]

{ #category : 'tests' }
OPPetriNetSimulatorTest >> testInitialClassMapping [

	| mapping |
	mapping := OPPetriNetSimulator initialClassMapping.
	self assert: (mapping at: OPPetriNetNormalArc) identicalTo: OPPetriNetNormalArcSimulator.
	self assert: (mapping at: OPPetriNetInhibitorArc) identicalTo: OPPetriNetInhibitorArcSimulator.
	self assert: (mapping at: OPPetriNetResetArc) identicalTo: OPPetriNetResetArcSimulator.
	self assert: (mapping at: OPPetriNetPTPlace) identicalTo: OPPetriNetPlaceSimulator.
	self assert: (mapping at: OPPetriNetTransition) identicalTo: OPPetriNetTransitionSimulator
]

{ #category : 'tests' }
OPPetriNetSimulatorTest >> testSteppingAll [

	| items stepped didAction |
	simulator setSteppingAll.

	items := simulator itemsForAction.
	self assert: items size equals: 2.
	self assert: (items collect: #class as: Array) equals: {
			OPPetriNetTransitionSimulator.
			OPPetriNetTransitionSimulator }.
	self assertCollection: (items collect: [ :eachItem | eachItem model name ]) hasSameElements: #( 'T1' 'T2' ).
	items do: [ :eachItem |
			self assert: eachItem isSimulable description: 'Every transition simulator must be simulable'.
			self assert: eachItem isSteppable description: 'Every transition simulator must be steppable' ].

	stepped := OrderedCollection new.
	didAction := OrderedCollection new.
	items do: [ :eachItem | eachItem when: OPSimulatorStepped do: [ :event | stepped add: event ] for: self ].
	items do: [ :eachItem | eachItem when: OPSimulatorDidAction do: [ :event | didAction add: event ] for: self ].
	simulator step.
	self assert: stepped size equals: 2.
	self assertCollection: (stepped collect: #simulator) hasSameElements: items.
	self assert: didAction size equals: 4.
	self assertCollection: (didAction collect: [ :eachEvent | eachEvent simulator -> eachEvent index ]) hasSameElements: {
			(items first -> 1).
			(items first -> 2).
			(items second -> 1).
			(items second -> 2) }
]
