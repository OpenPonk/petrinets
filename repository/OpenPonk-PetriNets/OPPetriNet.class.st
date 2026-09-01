"
Model representing a Petri Net diagram. Acts as the root container for places, transitions, and arcs.
"
Class {
	#name : 'OPPetriNet',
	#superclass : 'OPModelObject',
	#category : 'OpenPonk-PetriNets-Models',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPPetriNet >> arcs [
	^ elements select: #isArc
]

{ #category : 'accessing' }
OPPetriNet >> nodes [
	^ elements select: #isNode
]

{ #category : 'accessing' }
OPPetriNet >> places [
	^ elements select: #isPlace
]

{ #category : 'accessing' }
OPPetriNet >> transitions [
	^ elements select: #isTransition
]
