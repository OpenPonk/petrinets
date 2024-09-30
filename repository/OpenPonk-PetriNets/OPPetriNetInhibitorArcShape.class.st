Class {
	#name : 'OPPetriNetInhibitorArcShape',
	#superclass : 'OPPetriNetArcShape',
	#category : 'OpenPonk-PetriNets-Shapes',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Shapes'
}

{ #category : 'hooks' }
OPPetriNetInhibitorArcShape >> headMarker [

	^ OPRSMarkerBuilder circle asEmptyMarker
]
