"
I'm simulator for non-edge elements.
"
Class {
	#name : #OPPetriNetNodeSimulator,
	#superclass : #OPElementSimulator,
	#category : #'OpenPonk-PetriNets-Simulation'
}

{ #category : #'integer tokens' }
OPPetriNetNodeSimulator >> addPetriNetTokens: anInteger [
	"do nothing"

	
]

{ #category : #testing }
OPPetriNetNodeSimulator >> canReceivePetriNetTokens: anAmount [
	self subclassResponsibility
]

{ #category : #testing }
OPPetriNetNodeSimulator >> canSendPetriNetTokens: anAmount [
	self subclassResponsibility
]

{ #category : #'integer tokens' }
OPPetriNetNodeSimulator >> removePetriNetTokens: anInteger [
	"do nothing"

	
]
