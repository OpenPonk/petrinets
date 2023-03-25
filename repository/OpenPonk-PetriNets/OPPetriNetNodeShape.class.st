Class {
	#name : #OPPetriNetNodeShape,
	#superclass : #OPShape,
	#traits : 'OPTDIColoredAsFill',
	#classTraits : 'OPTDIColoredAsFill classTrait',
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #rendering }
OPPetriNetNodeShape >> renderShapeDetails [

	| label selectable |
	label := OPRSLabeled new.
	label location below.
	label color: Color black.
	roassalShape addInteraction: label.

	roassalShape @ OPRSSelectionDraggable.
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
