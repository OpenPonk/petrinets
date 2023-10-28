Class {
	#name : #OPPetriNetInhibitorArcShape,
	#superclass : #OPPetriNetArcShape,
	#category : #'OpenPonk-PetriNets-Shapes'
}

{ #category : #hooks }
OPPetriNetInhibitorArcShape >> headMarker [

	^ OPRSMarkerBuilder circle asEmptyMarker
]
