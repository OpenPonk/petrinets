"
Diagram element representing a reset arc in a Petri Net.
Defines specific head markers on its underlying Roassal shape.
"
Class {
	#name : 'OPPetriNetResetArcShape',
	#superclass : 'OPPetriNetArcShape',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'hooks' }
OPPetriNetResetArcShape >> headMarker [

	^ OPRSMarkerBuilder doubleTriangle asEmptyMarker
]
