Class {
	#name : #OPPetriNetArcController,
	#superclass : #OPDirectionalRelationshipController,
	#category : #'OpenPonk-PetriNets-Controllers'
}

{ #category : #rendering }
OPPetriNetArcController >> addLabels [
	self constraintLabel: #name balance: 0.4 offset: 12
]

{ #category : #rendering }
OPPetriNetArcController >> constraintLabel: labelName balance: aFloat offset: aNumber [
	| label |
	label := (RTLabel new
		height: 10;
		color: figure shape color;
		text: self model name;
		element) yourself.
	label model: figure.
	figure trachelShape
		addCallback:
			(TRRemoveCallback new
				block: [ :removedShape | 
					figure labels removeKey: labelName.
					label remove ]).
	figure labels at: labelName put: label.
	label @ RTDraggable.
	label renderIn: figure view.
	OPRTRailConstraint new
		initialPosition: aFloat;
		distance: aNumber;
		noGripLine;
		element: label connection: figure
]

{ #category : #rendering }
OPPetriNetArcController >> createEdgeFrom: fromElement to: toElement [
	^ (OPRTStyledConnection new
		head: self headShapeClass;
		attachPoint: OPRTMultilineBorderAttachPoint new;
		color: Color black;
		edgeFrom: fromElement to: toElement)
		@ OPRTConnectionHandles;
		yourself
]

{ #category : #hooks }
OPPetriNetArcController >> headShapeClass [
	"line decoration shape class used as head"

	^ self subclassResponsibility
]

{ #category : #'canvas actions' }
OPPetriNetArcController >> hideSelectionFeedback [
	self figure view
		ifNotNil: [ self figure announce: OPTRUnfocused.
			self figure view signalUpdate ]
]

{ #category : #announcements }
OPPetriNetArcController >> internalSubscribeTo: aModel [
	super internalSubscribeTo: aModel.
	aModel when: OPElementRemoved do: [ :e | self removeController ]
]

{ #category : #testing }
OPPetriNetArcController >> isHideable [
	^ true
]

{ #category : #hooks }
OPPetriNetArcController >> refreshFigure [
	super refreshFigure.
	(figure labels at: #name) trachelShape text: self model name.
	^ self figure
]

{ #category : #removing }
OPPetriNetArcController >> removeModel [
	self model announcer unsubscribe: self.
	self diagramController model remove: self model
]

{ #category : #rendering }
OPPetriNetArcController >> renderFigureIn: aView [
	self diagramController addingFigureFor: self.
	figure := self
		createEdgeFrom: self source figure
		to: self target figure.
	figure renderIn: aView.
	self addLabels.
	^ self diagramController addedFigureFor: self
]

{ #category : #rendering }
OPPetriNetArcController >> showInDiagram: aDiagramController [
	source
		ifNil: [ self source: (aDiagramController showWithoutDependentInDiagramModel: model source) ].
	target
		ifNil: [ self target: (aDiagramController showWithoutDependentInDiagramModel: model target) ].
	^ super showInDiagram: aDiagramController
]

{ #category : #'canvas actions' }
OPPetriNetArcController >> showSelectionFeedback [
	self figure announce: OPTRFocused.
	self figure view signalUpdate
]

{ #category : #rendering }
OPPetriNetArcController >> showWithoutDependentInDiagram: aDiagramController [
	source
		ifNil:
			[ self source: (aDiagramController showWithoutDependentInDiagramModel: model source) ].
	target
		ifNil: [ self target: (aDiagramController showWithoutDependentInDiagramModel: model target) ].
	^ super showWithoutDependentInDiagram: aDiagramController
]
