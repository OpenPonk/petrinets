Class {
	#name : 'OPBCPetriNetTransitionController',
	#superclass : 'OPPetriNetTransitionController',
	#category : 'OpenPonk-BooleanColoredPetriNets-Controllers',
	#package : 'OpenPonk-BooleanColoredPetriNets',
	#tag : 'Controllers'
}

{ #category : 'initialization' }
OPBCPetriNetTransitionController class >> initializePossibleConnected [
	PossibleOutgoing := Set with: OPPetriNetArcWithExpressionController
]
