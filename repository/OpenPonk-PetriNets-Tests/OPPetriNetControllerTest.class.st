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

	| palette entryLabels |
	palette := OPPalette new.
	controller initializePalette: palette.
	self assert: palette items size equals: 8.
	entryLabels := palette items select: [ :eachItem | eachItem class == OPPaletteEntry ] thenCollect: #label.
	self assert: entryLabels asArray equals: #( 'Select' 'Place' 'Transition' 'Arc' 'Inhibitor Arc' 'Reset Arc' )
]
