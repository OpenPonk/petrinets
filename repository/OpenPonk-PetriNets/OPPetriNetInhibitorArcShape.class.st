Class {
	#name : #OPPetriNetInhibitorArcShape,
	#superclass : #OPPetriNetArcShape,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #hooks }
OPPetriNetInhibitorArcShape >> headMarker [

	^ OPRSMarkerBuilder circle asEmptyMarker
]
