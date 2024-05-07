"
I simulate inhibitor arc
"
Class {
	#name : 'OPPetriNetInhibitorArcSimulator',
	#superclass : 'OPPetriNetInputArcSimulator',
	#category : 'OpenPonk-PetriNets-Simulation',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPPetriNetInhibitorArcSimulator >> handleFire [
	"inhibitor arc does nothing with tokens, it just acts as firing condition"

	"do nothing"

	
]

{ #category : 'testing' }
OPPetriNetInhibitorArcSimulator >> isEnabled [
	"are conditions for firing met on this arc? - are there no tokens in place?"

	^ self source petriNetTokens isZero
]
