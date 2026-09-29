"
Simulator component for Petri Net reset arcs.
Evaluates enabling conditions and empties all tokens from the source place when the transition fires.
"
Class {
	#name : 'OPPetriNetResetArcSimulator',
	#superclass : 'OPPetriNetInputArcSimulator',
	#category : 'OpenPonk-PetriNets-Simulation',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPPetriNetResetArcSimulator >> handleFire [
	self source petriNetTokens: 0
]

{ #category : 'testing' }
OPPetriNetResetArcSimulator >> isEnabled [
	"are conditions for firing met on this arc? - reset arc does not act as firing condition"

	^ true
]
