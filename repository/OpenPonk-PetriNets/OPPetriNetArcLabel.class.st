"
Abstract base class for labels attached to Petri Net arcs.
Manages default minimum distance constraints along the arc's routing path.
"
Class {
	#name : 'OPPetriNetArcLabel',
	#superclass : 'OPEdgeLabel',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'adding' }
OPPetriNetArcLabel >> defaultMinDistance [

	^ 5
]
