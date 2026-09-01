"
Warning signaled when a Petri Net place exceeds its defined token capacity during simulation or modeling.
"
Class {
	#name : 'OPPetriNetPlaceOverCapacity',
	#superclass : 'Warning',
	#instVars : [
		'place'
	],
	#category : 'OpenPonk-PetriNets-Models',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Models'
}

{ #category : 'signalling' }
OPPetriNetPlaceOverCapacity class >> signalPlace: aPlace [
	self new
		place: aPlace;
		signal
]

{ #category : 'accessing' }
OPPetriNetPlaceOverCapacity >> place [
	^ place
]

{ #category : 'accessing' }
OPPetriNetPlaceOverCapacity >> place: aPlace [
	place := aPlace
]
