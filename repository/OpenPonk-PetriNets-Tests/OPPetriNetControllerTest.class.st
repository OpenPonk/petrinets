"
Tests diagram controller interactions, token semantics, and canvas events for Petri Net diagrams.
"
Class {
	#name : 'OPPetriNetControllerTest',
	#superclass : 'OPAbstractDiagramControllerTest',
	#category : 'OpenPonk-PetriNets-Tests-Controllers',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Controllers'
}

{ #category : 'constants' }
OPPetriNetControllerTest >> controllerClass [

	^ OPPetriNetController
]

{ #category : 'constants' }
OPPetriNetControllerTest >> diagramModelClass [

	^ OPPetriNet
]

{ #category : 'constants' }
OPPetriNetControllerTest >> modelClass [

	^ OPPetriNet
]

{ #category : 'tests' }
OPPetriNetControllerTest >> testControllerFactory [

	| factory |
	factory := controller controllerFactory.
	self assert: factory class identicalTo: OPControllerFactory.
	{
		(OPPetriNetInhibitorArc -> OPPetriNetInhibitorArcController).
		(OPPetriNetResetArc -> OPPetriNetResetArcController).
		(OPPetriNetNormalArc -> OPPetriNetNormalArcController).
		(OPPetriNetTransition -> OPPetriNetTransitionController).
		(OPPetriNetPTPlace -> OPPetriNetPTPlaceController) } do: [ :eachPair |
			| instance |
			instance := eachPair key new.
			self
				assert: (factory hasControllerFor: instance)
				description: ('Controller factory must register {1}' format: { eachPair key name }).
			self assert: (factory newControllerFor: instance) class identicalTo: eachPair value ].
	self
		deny: (factory hasControllerFor: OPPetriNet new)
		description: 'Controller factory must not register diagram model OPPetriNet'
]

{ #category : 'tests' }
OPPetriNetControllerTest >> testInitializePalette [

	| palette entries expectedToolClasses |
	palette := OPPalette new.
	controller initializePalette: palette.
	self assert: palette items size equals: 8.
	entries := palette items select: [ :eachItem | eachItem class == OPPaletteEntry ].
	expectedToolClasses := {
		                       ('Place' -> OPPetriNetPTPlaceController).
		                       ('Transition' -> OPPetriNetTransitionController).
		                       ('Arc' -> OPPetriNetNormalArcController).
		                       ('Inhibitor Arc' -> OPPetriNetInhibitorArcController).
		                       ('Reset Arc' -> OPPetriNetResetArcController) }.
	self assert: (entries collect: #label as: Array) equals: { 'Select' } , (expectedToolClasses collect: #key).
	expectedToolClasses do: [ :eachPair |
			| entry createdController |
			entry := entries detect: [ :eachEntry | eachEntry label = eachPair key ].
			entry performAction.
			createdController := palette selectedTool instVarNamed: #controller.
			self assert: createdController class identicalTo: eachPair value ]
]

{ #category : 'tests' }
OPPetriNetControllerTest >> testNodeConnectionRulesAndPossibleOutgoingInitialization [

	| placeController transitionController normalArcController inhibitorArcController resetArcController savedPlaceOutgoing savedTransitionOutgoing |
	placeController := OPPetriNetPTPlaceController new.
	transitionController := OPPetriNetTransitionController new.
	normalArcController := OPPetriNetNormalArcController new.
	inhibitorArcController := OPPetriNetInhibitorArcController new.
	resetArcController := OPPetriNetResetArcController new.

	savedPlaceOutgoing := OPPetriNetPTPlaceController instVarNamed: #PossibleOutgoing.
	savedTransitionOutgoing := OPPetriNetTransitionController instVarNamed: #PossibleOutgoing.
	[
		OPPetriNetPTPlaceController instVarNamed: #PossibleOutgoing put: nil.
		OPPetriNetTransitionController instVarNamed: #PossibleOutgoing put: nil.

		self assert: (placeController canBeSourceFor: normalArcController) description: 'Place must allow normal outgoing arc'.
		self assert: (placeController canBeSourceFor: inhibitorArcController) description: 'Place must allow inhibitor outgoing arc'.
		self assert: (placeController canBeSourceFor: resetArcController) description: 'Place must allow reset outgoing arc'.
		self deny: (placeController canBeSourceFor: transitionController) description: 'Place must not be source for a node controller'.

		self assert: (transitionController canBeSourceFor: normalArcController) description: 'Transition must allow normal outgoing arc'.
		self
			deny: (transitionController canBeSourceFor: inhibitorArcController)
			description: 'Transition must not allow inhibitor outgoing arc'.
		self deny: (transitionController canBeSourceFor: resetArcController) description: 'Transition must not allow reset outgoing arc'.

		normalArcController source: placeController.
		self assert: (transitionController canBeTargetFor: normalArcController) description: 'Transition must accept arc from place'.
		self deny: (placeController canBeTargetFor: normalArcController) description: 'Place must reject arc from another place'.

		normalArcController source: transitionController.
		self assert: (placeController canBeTargetFor: normalArcController) description: 'Place must accept arc from transition'.
		self
			deny: (transitionController canBeTargetFor: normalArcController)
			description: 'Transition must reject arc from another transition'.
		self deny: (placeController canBeTargetFor: transitionController) description: 'Node must reject non-arc controller as target' ]
		ensure: [
				OPPetriNetPTPlaceController instVarNamed: #PossibleOutgoing put: savedPlaceOutgoing.
				OPPetriNetTransitionController instVarNamed: #PossibleOutgoing put: savedTransitionOutgoing ]
]
