"
Diagram element representing a standard directed arc in a Petri Net. Manages the rendering details, routing, and head markers of its underlying Roassal shape.
"
Class {
	#name : 'OPPetriNetArcShape',
	#superclass : 'OPEdge',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'initialization' }
OPPetriNetArcShape >> createOwnedElementsWithoutController [

	self ownedElements ifNotEmpty: [ ^ self ].
	OPPetriNetArcNameShape in: self
]

{ #category : 'hooks' }
OPPetriNetArcShape >> headMarker [
	"line decoration shape used as head marker"

	^ self subclassResponsibility
]

{ #category : 'rendering' }
OPPetriNetArcShape >> renderBasicShape [

	^ (self source = self target
		   ifTrue: [ OPRSBezier ]
		   ifFalse: [ OPRSPolyline ]) new
		  markerEnd: self headMarker;
		  withBorderAttachPoint;
		  controlPointsController: OPRSDraggableCPController new;
		  addInteraction: OPRSDraggableControlPoints;
		  color: Color black;
		  from: self source roassalShape;
		  to: self target roassalShape;
		  yourself
]
