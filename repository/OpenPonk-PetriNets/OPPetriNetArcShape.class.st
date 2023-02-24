Class {
	#name : #OPPetriNetArcShape,
	#superclass : #OPEdge,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #creation }
OPPetriNetArcShape >> createOwnedElementsWithoutController [

	super createOwnedElementsWithoutController.
	OPPetriNetArcNameShape in: self forModelElement: self modelElement
]

{ #category : #hooks }
OPPetriNetArcShape >> headMarker [
	"line decoration shape used as head marker"

	^ self subclassResponsibility
]

{ #category : #rendering }
OPPetriNetArcShape >> renderBasicShape [

	^ OPRSPolyline new
		  markerEnd: self headMarker;
		  withBorderAttachPoint;
		  controlPointsController: OPRSPolylineCPController new;
		  addInteraction: OPRSPolylineHandles;
		  color: Color black;
		  from: self source roassalShape;
		  to: self target roassalShape;
		  yourself
]

{ #category : #rendering }
OPPetriNetArcShape >> renderShapeDetails [

	| selectable |
	selectable := OPRSSelectable new.
	selectable highlightColor: Color blue.
	roassalShape @ selectable
]
