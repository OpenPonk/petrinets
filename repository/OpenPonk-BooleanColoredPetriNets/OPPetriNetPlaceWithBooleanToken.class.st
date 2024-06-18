Class {
	#name : 'OPPetriNetPlaceWithBooleanToken',
	#superclass : 'OPPetriNetAbstractPlace',
	#instVars : [
		'token'
	],
	#category : 'OpenPonk-BooleanColoredPetriNets-Models',
	#package : 'OpenPonk-BooleanColoredPetriNets',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPPetriNetPlaceWithBooleanToken >> token [
	^ token
]

{ #category : 'accessing' }
OPPetriNetPlaceWithBooleanToken >> token: aBoolean [
	token := aBoolean.
	self changed
]
