Class {
	#name : #OPPetriNetResetArcShape,
	#superclass : #OPPetriNetArcShape,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #hooks }
OPPetriNetResetArcShape >> headMarker [

	^ ((RSShapeFactory polygonWithPoints: { 
			    (0 @ 0).
			    (-5 @ 8).
			    (0 @ 8).
			    (-5 @ 16).
			    (5 @ 16).
			    (0 @ 8).
			    (5 @ 8) }) borderColor: Color black) asEmptyMarker
]
