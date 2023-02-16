Class {
	#name : #OPPetriNetNormalArcShape,
	#superclass : #OPPetriNetWeightedArcShape,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #hooks }
OPPetriNetNormalArcShape >> headMarker [

	^ OPRSMarkerBuilder arrow
]
