"
Controller for Petri Net places.
Manages diagram lifecycle and interactions for place nodes.
"
Class {
	#name : 'OPPetriNetPlaceController',
	#superclass : 'OPPetriNetNodeController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'class initialization' }
OPPetriNetPlaceController class >> initializePossibleConnected [
	PossibleOutgoing := Set
		with: OPPetriNetInhibitorArcController
		with: OPPetriNetNormalArcController
		with: OPPetriNetResetArcController
]
