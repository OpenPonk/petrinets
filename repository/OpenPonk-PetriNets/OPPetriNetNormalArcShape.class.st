Class {
	#name : #OPPetriNetNormalArcShape,
	#superclass : #OPPetriNetWeightedArcShape,
	#category : #'OpenPonk-PetriNets-Shapes'
}

{ #category : #hooks }
OPPetriNetNormalArcShape >> headMarker [

	^ OPRSMarkerBuilder arrow
]
