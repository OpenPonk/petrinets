"
I simulate Petri net place transition.
I am simulable.

Firing:
First I tell incoming arcs to move tokens from their input places to me and then I tell outgoing arcs to move tokens from me to their output places.

    Instance Variables
	firing:		tells whether started firing but did not complete yet
	tempTokens:		tokens temporarily saved her while firing
"
Class {
	#name : 'OPPetriNetTransitionSimulator',
	#superclass : 'OPPetriNetNodeSimulator',
	#instVars : [
		'firing'
	],
	#category : 'OpenPonk-PetriNets-Simulation',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Simulation'
}

{ #category : 'testing' }
OPPetriNetTransitionSimulator >> canReceivePetriNetTokens: anAmount [
	^ true
]

{ #category : 'testing' }
OPPetriNetTransitionSimulator >> canSendPetriNetTokens: anAmount [
	^ true
]

{ #category : 'actions' }
OPPetriNetTransitionSimulator >> fire [
	self step
]

{ #category : 'actions' }
OPPetriNetTransitionSimulator >> fireIncoming [
	self isEnabled
		ifFalse: [ ^ self ].
	firing := true.
	self incomingDo: [ :arc | arc handleFire ]
]

{ #category : 'actions' }
OPPetriNetTransitionSimulator >> fireOutgoing [
	firing
		ifFalse: [ ^ self ].
	self outgoingDo: [ :arc | arc handleFire ].
	firing := false
]

{ #category : 'initialization' }
OPPetriNetTransitionSimulator >> initialize [
	super initialize.
	firing := false
]

{ #category : 'testing' }
OPPetriNetTransitionSimulator >> isEnabled [
	"can be fired?"

	^ (incoming allSatisfy: [ :arc | arc isEnabled ]) and: [ outgoing allSatisfy: [ :arc | arc isEnabled ] ]
]

{ #category : 'testing' }
OPPetriNetTransitionSimulator >> isSimulable [
	^ true
]

{ #category : 'testing' }
OPPetriNetTransitionSimulator >> isSteppable [
	^ self isEnabled
]

{ #category : 'initialization' }
OPPetriNetTransitionSimulator >> setDefaultStepping [
	"sets default stepping settings"

	super setDefaultStepping.
	self
		resetActions;
		addAction: [ :item | item fireIncoming ];
		addAction: [ :item | item fireOutgoing ]
]
