"
Simulator component for Petri Net normal input arcs.
Evaluates token availability and manages token transfer from place to transition upon firing.
"
Class {
	#name : 'OPPetriNetNormalArcSimulator',
	#superclass : 'OPPetriNetInputArcSimulator',
	#category : 'OpenPonk-PetriNets-Simulation',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPPetriNetNormalArcSimulator >> handleFire [
	"moves weight amount of tokens between place and transition"

	| transfer |
	self source removePetriNetTokens: self model weight.
	self target addPetriNetTokens: self model weight.
	diagramSimulator ifNil: [ ^ self ].
	transfer := (OPSimulationTransfer source: self source model edge: self model target: self target model)
		            amount: self model weight;
		            yourself.
	self target isSimulable
		ifTrue: [
				transfer
					actorModel: self target model;
					phase: 1 ]
		ifFalse: [
				transfer
					actorModel: self source model;
					phase: 2 ].
	diagramSimulator recordTransfer: transfer
]

{ #category : 'testing' }
OPPetriNetNormalArcSimulator >> isEnabled [
	"are conditions for firing met on this arc? - is there at least weight amount of tokens in place?"

	^ (self source canSendPetriNetTokens: self model weight)
		and: [ self target canReceivePetriNetTokens: self model weight ]
]
