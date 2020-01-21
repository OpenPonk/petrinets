Class {
	#name : #OPPetriNetArcWithExpression,
	#superclass : #OPPetriNetArc,
	#category : 'OpenPonk-BooleanColoredPetriNets-Models'
}

{ #category : #accessing }
OPPetriNetArcWithExpression >> expression [
	^ self name
]

{ #category : #accessing }
OPPetriNetArcWithExpression >> expression: aString [
	self name: aString
]
