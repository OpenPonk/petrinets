Class {
	#name : #OPBCPetriNetTransitionController,
	#superclass : #OPPetriNetTransitionController,
	#category : 'OpenPonk-BooleanColoredPetriNets-Controllers'
}

{ #category : #initialization }
OPBCPetriNetTransitionController class >> initializePossibleConnected [
	PossibleOutgoing := Set with: OPPetriNetArcWithExpressionController
]
