Class {
	#name : #OPPetriNetResetArcShape,
	#superclass : #OPPetriNetArcShape,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #hooks }
OPPetriNetResetArcShape >> headMarker [

	^ OPRSMarkerBuilder doubleTriangle asEmptyMarker
]
