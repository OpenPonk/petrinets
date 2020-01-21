"
I represent Petri net place
"
Class {
	#name : #OPPetriNetAbstractPlace,
	#superclass : #OPPetriNetNode,
	#instVars : [
		'tokens'
	],
	#category : 'OpenPonk-PetriNets-Models'
}

{ #category : #testing }
OPPetriNetAbstractPlace >> isPlace [
	^ true
]

{ #category : #removing }
OPPetriNetAbstractPlace >> removeToken [
	"removes one token"

	self subclassResponsibility
]
