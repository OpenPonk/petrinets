"
Abstract model representing a place in a Petri Net. Maintains the token count and manages token logic.
"
Class {
	#name : 'OPPetriNetAbstractPlace',
	#superclass : 'OPPetriNetNode',
	#instVars : [
		'tokens'
	],
	#category : 'OpenPonk-PetriNets-Models',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Models'
}

{ #category : 'testing' }
OPPetriNetAbstractPlace >> isPlace [
	^ true
]

{ #category : 'removing' }
OPPetriNetAbstractPlace >> removeToken [
	"removes one token"

	self subclassResponsibility
]
