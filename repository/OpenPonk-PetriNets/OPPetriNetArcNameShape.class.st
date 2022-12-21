Class {
	#name : #OPPetriNetArcNameShape,
	#superclass : #OPPetriNetArcLabel,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #'as yet unclassified' }
OPPetriNetArcNameShape >> defaultBalance [

	^ 0.4
]

{ #category : #accessing }
OPPetriNetArcNameShape >> text [

	^ self owningElement modelElement name
]
