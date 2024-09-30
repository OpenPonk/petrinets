Class {
	#name : 'OPPetriNetNormalArcShape',
	#superclass : 'OPPetriNetWeightedArcShape',
	#category : 'OpenPonk-PetriNets-Shapes',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Shapes'
}

{ #category : 'hooks' }
OPPetriNetNormalArcShape >> headMarker [

	^ OPRSMarkerBuilder arrow
]
