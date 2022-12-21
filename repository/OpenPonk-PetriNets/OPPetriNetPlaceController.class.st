Class {
	#name : #OPPetriNetPlaceController,
	#superclass : #OPPetriNetNodeController,
	#instVars : [
		'tokenGroup'
	],
	#category : #'OpenPonk-PetriNets-Controllers'
}

{ #category : #'class initialization' }
OPPetriNetPlaceController class >> initializePossibleConnected [
	PossibleOutgoing := Set
		with: OPPetriNetInhibitorArcController
		with: OPPetriNetNormalArcController
		with: OPPetriNetResetArcController
]
