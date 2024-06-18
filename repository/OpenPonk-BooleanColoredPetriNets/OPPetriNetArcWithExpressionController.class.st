Class {
	#name : 'OPPetriNetArcWithExpressionController',
	#superclass : 'OPPetriNetArcController',
	#category : 'OpenPonk-BooleanColoredPetriNets-Controllers',
	#package : 'OpenPonk-BooleanColoredPetriNets',
	#tag : 'Controllers'
}

{ #category : 'forms' }
OPPetriNetArcWithExpressionController >> buildEditorForm: aForm [
	(aForm addTextInput: 'Expression')
		text: self model expression;
		whenTextIsAccepted: [ :newValue | self model expression: newValue ]
]

{ #category : 'hooks' }
OPPetriNetArcWithExpressionController >> headShapeClass [
	^ RTSimpleArrow
]
