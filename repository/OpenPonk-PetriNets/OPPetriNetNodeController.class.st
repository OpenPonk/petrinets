Class {
	#name : #OPPetriNetNodeController,
	#superclass : #OPElementController,
	#classInstVars : [
		'PossibleOutgoing'
	],
	#category : #'OpenPonk-PetriNets-Controllers'
}

{ #category : #'class initialization' }
OPPetriNetNodeController class >> initializePossibleConnected [
	self subclassResponsibility
]

{ #category : #testing }
OPPetriNetNodeController class >> isPossibleOutgoing: aController [
	PossibleOutgoing ifNil: [ self initializePossibleConnected ].
	^ PossibleOutgoing includes: aController
]

{ #category : #forms }
OPPetriNetNodeController >> buildEditorForm: aForm [
	(aForm addText: 'Name')
		text: self model name;
		whenTextIsAccepted: [ :newValue | 
			self model name: newValue asString.
			self refreshFigure ]
]

{ #category : #testing }
OPPetriNetNodeController >> canBeSourceFor: aController [
	^ self class isPossibleOutgoing: aController class
]

{ #category : #testing }
OPPetriNetNodeController >> canBeTargetFor: aController [
	^ (aController isKindOf: OPPetriNetArcController) and: [ self class ~= aController source class ]
]

{ #category : #hooks }
OPPetriNetNodeController >> createRoassalShape [
	^ self subclassResponsibility
]

{ #category : #accessing }
OPPetriNetNodeController >> dependentElements [
	^ (model incoming , model outgoing) asSet
]

{ #category : #announcements }
OPPetriNetNodeController >> internalSubscribeTo: aModel [
	super internalSubscribeTo: aModel.
	aModel when: OPElementRemoved do: [ :e | self removeController ]
]

{ #category : #testing }
OPPetriNetNodeController >> isHideable [
	^ true
]

{ #category : #connecting }
OPPetriNetNodeController >> modelAsParent [
	^ self model owner
]

{ #category : #figures }
OPPetriNetNodeController >> refreshFigure [
	(figure attributeAt: #RTLabelledLabel) text: self model name.
	^ super refreshFigure
]

{ #category : #removing }
OPPetriNetNodeController >> removeModel [
	self model announcer unsubscribe: self.
	self diagramController model remove: self model
]

{ #category : #rendering }
OPPetriNetNodeController >> renderFigureIn: aView [
	self diagramController addingFigureFor: self.
	figure := self createRoassalShape elementOn: self model.
	figure
		addInteraction:
			(OPRTMultilineLabeled new
				view: aView;
				below;
				color: Color black;
				yourself).
	figure @ RTDraggable.
	figure @ OPRTFocusable.
	figure renderIn: aView.
	^ self diagramController addedFigureFor: self
]

{ #category : #'canvas actions' }
OPPetriNetNodeController >> showSelectionFeedback [
	super showSelectionFeedback.
	self figure view signalUpdate
]
