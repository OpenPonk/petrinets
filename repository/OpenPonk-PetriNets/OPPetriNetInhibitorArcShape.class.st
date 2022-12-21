Class {
	#name : #OPPetriNetInhibitorArcShape,
	#superclass : #OPPetriNetArcShape,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #hooks }
OPPetriNetInhibitorArcShape >> headMarker [

	| marker |
	marker := RSCircle new
		          size: 10;
		          borderColor: Color black;
		          asEmptyMarker.
	marker offset: 5.
	^ marker
]
