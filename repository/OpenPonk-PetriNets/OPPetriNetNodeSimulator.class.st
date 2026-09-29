"
Simulator component for non-edge Petri Net elements. Evaluates whether a node can receive or send tokens during net execution.
"
Class {
	#name : 'OPPetriNetNodeSimulator',
	#superclass : 'OPElementSimulator',
	#category : 'OpenPonk-PetriNets-Simulation',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Simulation'
}

{ #category : 'integer tokens' }
OPPetriNetNodeSimulator >> addPetriNetTokens: anInteger [
	"do nothing"

	
]

{ #category : 'testing' }
OPPetriNetNodeSimulator >> canReceivePetriNetTokens: anAmount [
	self subclassResponsibility
]

{ #category : 'testing' }
OPPetriNetNodeSimulator >> canSendPetriNetTokens: anAmount [
	self subclassResponsibility
]

{ #category : 'integer tokens' }
OPPetriNetNodeSimulator >> removePetriNetTokens: anInteger [
	"do nothing"

	
]
