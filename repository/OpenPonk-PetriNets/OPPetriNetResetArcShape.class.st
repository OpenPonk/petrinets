Class {
	#name : #OPPetriNetResetArcShape,
	#superclass : #OPPetriNetArcShape,
	#category : #'OpenPonk-PetriNets-Shapes'
}

{ #category : #hooks }
OPPetriNetResetArcShape >> headMarker [

	^ OPRSMarkerBuilder doubleTriangle asEmptyMarker
]
