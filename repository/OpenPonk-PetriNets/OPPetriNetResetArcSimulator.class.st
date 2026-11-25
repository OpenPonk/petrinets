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

	| removedTokens |
	removedTokens := self source petriNetTokens.
	self source petriNetTokens: 0.
	(removedTokens > 0 and: [ diagramSimulator isNotNil ]) ifTrue: [
			diagramSimulator recordTransfer: ((OPSimulationTransfer source: self source model edge: self model target: self target model)
					 actorModel: self target model;
					 amount: removedTokens;
					 phase: 1;
					 kind: #reset;
					 yourself) ]
]

{ #category : 'testing' }
OPPetriNetResetArcSimulator >> isEnabled [
	"are conditions for firing met on this arc? - reset arc does not act as firing condition"

	^ true
]
