"
I represent an arc with weight
"
Class {
	#name : 'OPPetriNetWeightedArc',
	#superclass : 'OPPetriNetArc',
	#instVars : [
		'weight'
	],
	#category : 'OpenPonk-PetriNets-Models',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Models'
}

{ #category : 'initialization' }
OPPetriNetWeightedArc >> initialize [
	super initialize.
	weight := 1
]

{ #category : 'accessing' }
OPPetriNetWeightedArc >> weight [
	"amount of tokens moved when fired"

	^ weight
]

{ #category : 'accessing' }
OPPetriNetWeightedArc >> weight: anInteger [
	"amount of tokens moved when fired"

	self assert: anInteger > 0 description: 'Weight must be positive'.
	weight := anInteger.
	self changed
]
