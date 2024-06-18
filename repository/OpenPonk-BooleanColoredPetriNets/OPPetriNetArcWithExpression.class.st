Class {
	#name : 'OPPetriNetArcWithExpression',
	#superclass : 'OPPetriNetArc',
	#category : 'OpenPonk-BooleanColoredPetriNets-Models',
	#package : 'OpenPonk-BooleanColoredPetriNets',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPPetriNetArcWithExpression >> expression [
	^ self name
]

{ #category : 'accessing' }
OPPetriNetArcWithExpression >> expression: aString [
	self name: aString
]
