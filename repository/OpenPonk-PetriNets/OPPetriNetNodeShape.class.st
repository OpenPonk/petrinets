Class {
	#name : #OPPetriNetNodeShape,
	#superclass : #OPShape,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #'as yet unclassified' }
OPPetriNetNodeShape >> color [

	^ self stylePropertyNamed: #fillColor ifAbsent: [ Color transparent ]
]

{ #category : #'as yet unclassified' }
OPPetriNetNodeShape >> color: aColor [

	^ self stylePropertyNamed: #fillColor put: aColor
]

{ #category : #hooks }
OPPetriNetNodeShape >> createRoassalShape [
	^ self subclassResponsibility
]

{ #category : #rendering }
OPPetriNetNodeShape >> renderBasicShape [

	^ self createRoassalShape model: self
]

{ #category : #rendering }
OPPetriNetNodeShape >> renderShapeDetails [

	| label selectable |
	label := RSLabeled new.
	label location below.
	label shapeBuilder labelShape color: Color black.
	roassalShape addInteraction: label.

	roassalShape @ OPRSSelectionDraggable thatDoesNotDragInnerShapes.
	selectable := OPRSSelectable new.
	self setupHighlight: selectable.
	roassalShape @ selectable
]

{ #category : #hooks }
OPPetriNetNodeShape >> setupHighlight: aHighlightable [

	aHighlightable highlightBorderColor: Color blue
]

{ #category : #rendering }
OPPetriNetNodeShape >> updateRenderFromModel [

	(roassalShape propertyAt: #RSLabeled) text: self modelElement name.

	super updateRenderFromModel.

	roassalShape signalUpdate
]

{ #category : #'as yet unclassified' }
OPPetriNetNodeShape >> updateRenderFromSelf [

	self isRendered ifFalse: [ ^ self ].
	roassalShape color: self color.
	super updateRenderFromSelf
]
