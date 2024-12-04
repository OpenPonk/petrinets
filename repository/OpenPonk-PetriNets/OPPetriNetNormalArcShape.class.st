Class {
	#name : 'OPPetriNetNormalArcShape',
	#superclass : 'OPPetriNetWeightedArcShape',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'hooks' }
OPPetriNetNormalArcShape >> headMarker [

	^ OPRSMarkerBuilder arrow
]
