Class {
	#name : 'OPPetriNetArcShape',
	#superclass : 'OPEdge',
	#category : 'OpenPonk-PetriNets-Shapes',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Shapes'
}

{ #category : 'creation' }
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
