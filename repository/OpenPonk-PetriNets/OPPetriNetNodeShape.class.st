Class {
	#name : #OPPetriNetNodeShape,
	#superclass : #OPShape,
	#traits : 'OPTDIColoredAsFill',
	#classTraits : 'OPTDIColoredAsFill classTrait',
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #rendering }
OPPetriNetNodeShape >> renderShapeDetails [

	| label |
	label := OPRSLabeled new.
	label location below.
	label color: Color black.
	roassalShape addInteraction: label
]

{ #category : #hooks }
OPPetriNetNodeShape >> selectableInteraction [

	^ OPRSSelectable highlightBorderColorBlue
]

{ #category : #rendering }
OPPetriNetNodeShape >> shouldBePositionableByUser [

	^ true
]

{ #category : #rendering }
OPPetriNetNodeShape >> updateRenderFromModel [

	(roassalShape propertyAt: #RSLabeled) text: self modelElement name.

	super updateRenderFromModel.

	roassalShape signalUpdate
]
