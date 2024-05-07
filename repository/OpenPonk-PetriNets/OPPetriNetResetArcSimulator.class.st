"
I simulate reset arc
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
