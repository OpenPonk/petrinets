"
Abstract base class for diagram elements representing Petri Net nodes. Handles rendering logic, color properties via traits, and interactions for its underlying Roassal shape.
"
Class {
	#name : 'OPPetriNetNodeShape',
	#superclass : 'OPBoundNode',
	#traits : 'OPTColoredAsFill',
	#classTraits : 'OPTColoredAsFill classTrait',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPPetriNetNodeShape >> renderShapeDetails [

	| label |
	label := OPRSLabeled new.
	label location below.
	label color: Color black.
	roassalShape addInteraction: label
]

{ #category : 'interactions' }
OPPetriNetNodeShape >> selectableInteraction [

	^ OPRSSelectable highlightBorderColorBlue
]

{ #category : 'rendering' }
OPPetriNetNodeShape >> updateRenderFromModel [

	(roassalShape propertyAt: #RSLabeled) text: self modelElement name.

	super updateRenderFromModel.

	roassalShape signalUpdate
]
