"
I'm simulator for edges
"
Class {
	#name : 'OPPetriNetArcSimulator',
	#superclass : 'OPEdgeSimulator',
	#category : 'OpenPonk-PetriNets-Simulation',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Simulation'
}

{ #category : 'actions' }
OPPetriNetArcSimulator >> handleFire [
	"applies correct action when connected transition is fired"

	self subclassResponsibility
]

{ #category : 'testing' }
OPPetriNetArcSimulator >> isEnabled [
	"are conditions for firing met on this arc?"

	^ self subclassResponsibility
]

{ #category : 'testing' }
OPPetriNetArcSimulator >> isSimulable [
	"could there be any possibility to step?"

	^ false
]

{ #category : 'testing' }
OPPetriNetArcSimulator >> isSteppable [
	"can I step right now?"

	^ false
]
