Class {
	#name : 'OPPetriNetInhibitorArcShape',
	#superclass : 'OPPetriNetArcShape',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'hooks' }
OPPetriNetInhibitorArcShape >> headMarker [

	^ OPRSMarkerBuilder circle asEmptyMarker
]
