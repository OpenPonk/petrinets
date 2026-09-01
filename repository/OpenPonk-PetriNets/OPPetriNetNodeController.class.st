"
Abstract base controller for Petri Net nodes (places and transitions). Manages diagram interactions and validates valid source and target connections.
"
Class {
	#name : 'OPPetriNetNodeController',
	#superclass : 'OPElementController',
	#classInstVars : [
		'PossibleOutgoing'
	],
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPPetriNetNodeController class >> diagramElementClass [

	^ OPPetriNetNodeShape
]

{ #category : 'class initialization' }
OPPetriNetNodeController class >> initializePossibleConnected [
	self subclassResponsibility
]

{ #category : 'testing' }
OPPetriNetNodeController class >> isPossibleOutgoing: aController [
	PossibleOutgoing ifNil: [ self initializePossibleConnected ].
	^ PossibleOutgoing includes: aController
]

{ #category : 'connecting' }
OPPetriNetNodeController >> canBeSourceFor: aController [
	^ self class isPossibleOutgoing: aController class
]

{ #category : 'connecting' }
OPPetriNetNodeController >> canBeTargetFor: aController [
	^ (aController isKindOf: OPPetriNetArcController) and: [ self class ~= aController source class ]
]
