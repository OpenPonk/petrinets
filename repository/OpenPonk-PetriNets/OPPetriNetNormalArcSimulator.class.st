"
I simulate normal input arc
"
Class {
	#name : #OPPetriNetNormalArcSimulator,
	#superclass : #OPPetriNetInputArcSimulator,
	#category : 'OpenPonk-PetriNets-Simulation'
}

{ #category : #actions }
OPPetriNetNormalArcSimulator >> handleFire [
	"moves weight amount of tokens between place and transition"

	self source removeTokensAmount: self model weight.
	self target addTokensAmount: self model weight.
]

{ #category : #testing }
OPPetriNetNormalArcSimulator >> isEnabled [
	"are conditions for firing met on this arc? - is there at least weight amount of tokens in place?"

	^ (self source canSendTokens: self model weight)
		and: [ self target canReceiveTokens: self model weight ]
]
