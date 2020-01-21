"
I'm simulator for non-edge elements.
"
Class {
	#name : #OPPetriNetNodeSimulator,
	#superclass : #OPElementSimulator,
	#category : 'OpenPonk-PetriNets-Simulation'
}

{ #category : #'integer tokens' }
OPPetriNetNodeSimulator >> addTokensAmount: anInteger [
	"do nothing"

	
]

{ #category : #testing }
OPPetriNetNodeSimulator >> canReceiveTokens: anAmount [
	self subclassResponsibility
]

{ #category : #testing }
OPPetriNetNodeSimulator >> canSendTokens: anAmount [
	self subclassResponsibility
]

{ #category : #'integer tokens' }
OPPetriNetNodeSimulator >> removeTokensAmount: anInteger [
	"do nothing"

	
]
