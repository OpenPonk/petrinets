"
Diagram element representing an inhibitor arc in a Petri Net. Defines specific head markers (usually a circle) on its underlying Roassal shape.
"
Class {
	#name : 'OPPetriNetInhibitorArcShape',
	#superclass : 'OPPetriNetArcShape',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'hooks' }
OPPetriNetInhibitorArcShape >> headMarker [

	^ OPRSMarkerBuilder circle asEmptyMarker
]
