"
Model representing a Petri Net transition.
Denotes an active component that fires and moves tokens between places.
"
Class {
	#name : 'OPPetriNetTransition',
	#superclass : 'OPPetriNetNode',
	#category : 'OpenPonk-PetriNets-Models',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Models'
}

{ #category : 'testing' }
OPPetriNetTransition >> isTransition [
	^ true
]
