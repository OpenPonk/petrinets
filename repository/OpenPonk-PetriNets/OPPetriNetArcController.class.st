Class {
	#name : #OPPetriNetArcController,
	#superclass : #OPDirectionalRelationshipController,
	#category : 'OpenPonk-PetriNets-Controllers'
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
		element)
		@ RTDraggable;
		yourself.
	label model: figure.
	figure trachelShape
		addCallback:
			(TRRemoveCallback new
				block: [ :removedShape | 
					figure labels removeKey: labelName.
					label remove ]).
	figure labels at: labelName put: label.
	label renderIn: figure view.
	OPRTEdgeAlongConstraint
		stick: label
		alongEdge: figure
		balance: aFloat
		offset: aNumber.
	OPRTElementsConstraint
		whenDragging: label
		drawLineToPoint: [ ((figure shape startingPointOf: figure)
				+ (figure shape endingPointOf: figure)) / 2 ]
]

{ #category : #rendering }
OPPetriNetArcController >> createEdgeFrom: fromElement to: toElement [
	^ OPRTStyledMultiLine new
		head: self headShapeClass;
		withBorderAttachPoint;
		color: Color black;
		edgeFrom: fromElement to: toElement
]

{ #category : #construction }
OPPetriNetArcController >> createModelIn: aParentModel [
	self model: self modelClass new.
	model source: self source model.
	model target: self target model.
	self source diagramController model add: model.
	^ model
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

{ #category : #hooks }
OPPetriNetArcController >> refreshFigure [
	super refreshFigure.
	(figure labels at: #name) trachelShape text: self model name
]

{ #category : #removing }
OPPetriNetArcController >> removeModel [
	self diagramController model remove: self model
]

{ #category : #rendering }
OPPetriNetArcController >> renderFigureIn: aView [
	figure := self
		createEdgeFrom: self source figure
		to: self target figure.
	figure renderIn: aView.
	self addLabels.
	self diagramController figureAdded: figure.
	^ figure
]

{ #category : #rendering }
OPPetriNetArcController >> showInDiagram: aDiagramController [
	source
		ifNil: [ self source: (aDiagramController controllerForModel: model source) ].
	target
		ifNil: [ self target: (aDiagramController controllerForModel: model target) ].
	^ super showInDiagram: aDiagramController
]

{ #category : #'canvas actions' }
OPPetriNetArcController >> showSelectionFeedback [
	self figure announce: OPTRFocused.
	self figure view signalUpdate
]

{ #category : #accessing }
OPPetriNetArcController >> sourceController: aController [
	self source: aController
]

{ #category : #accessing }
OPPetriNetArcController >> targetController: aController [
	self target: aController
]
