"
Diagram element representing a normal weighted arc in a Petri Net.
Defines standard arrow head markers on its underlying Roassal shape.
"
Class {
	#name : 'OPPetriNetNormalArcShape',
	#superclass : 'OPPetriNetWeightedArcShape',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'hooks' }
OPPetriNetNormalArcShape >> headMarker [

	^ OPRSMarkerBuilder arrow
]
