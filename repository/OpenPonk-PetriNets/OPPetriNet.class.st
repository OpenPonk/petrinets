"
DCPetriNet represents Petri net diagram
"
Class {
	#name : #OPPetriNet,
	#superclass : #OPModelObject,
	#category : 'OpenPonk-PetriNets-Models'
}

{ #category : #accessing }
OPPetriNet >> arcs [
	^ elements select: #isArc
]

{ #category : #accessing }
OPPetriNet >> nodes [
	^ elements select: #isNode
]

{ #category : #accessing }
OPPetriNet >> places [
	^ elements select: #isPlace
]

{ #category : #accessing }
OPPetriNet >> transitions [
	^ elements select: #isTransition
]
