Class {
	#name : 'OPPetriNetResetArcShape',
	#superclass : 'OPPetriNetArcShape',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'hooks' }
OPPetriNetResetArcShape >> headMarker [

	^ OPRSMarkerBuilder doubleTriangle asEmptyMarker
]
