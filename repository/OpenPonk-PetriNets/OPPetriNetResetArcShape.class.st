Class {
	#name : 'OPPetriNetResetArcShape',
	#superclass : 'OPPetriNetArcShape',
	#category : 'OpenPonk-PetriNets-Shapes',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Shapes'
}

{ #category : 'hooks' }
OPPetriNetResetArcShape >> headMarker [

	^ OPRSMarkerBuilder doubleTriangle asEmptyMarker
]
