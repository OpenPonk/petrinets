"
I simulate Petri net place element
"
Class {
	#name : #OPPetriNetPlaceSimulator,
	#superclass : #OPPetriNetNodeSimulator,
	#category : 'OpenPonk-PetriNets-Simulation'
}

{ #category : #'integer tokens' }
OPPetriNetPlaceSimulator >> addTokensAmount: anInteger [
	self tokensAmount: self tokensAmount + anInteger
]

{ #category : #testing }
OPPetriNetPlaceSimulator >> canReceiveTokens: anAmount [
	^ self tokensAmount + anAmount <= self capacity
]

{ #category : #testing }
OPPetriNetPlaceSimulator >> canSendTokens: anAmount [
	^ self tokensAmount >= anAmount
]

{ #category : #'integer tokens' }
OPPetriNetPlaceSimulator >> capacity [
	^ self model capacity
]

{ #category : #testing }
OPPetriNetPlaceSimulator >> isSimulable [
	^ false
]

{ #category : #testing }
OPPetriNetPlaceSimulator >> isSteppable [
	^ false
]

{ #category : #actions }
OPPetriNetPlaceSimulator >> loadState [
	"loads state of model into simulator"

	super loadState.
	model tokens: startingModel tokens
]

{ #category : #'integer tokens' }
OPPetriNetPlaceSimulator >> removeTokensAmount: anInteger [
	self tokensAmount: self tokensAmount - anInteger
]

{ #category : #'integer tokens' }
OPPetriNetPlaceSimulator >> tokensAmount [
	^ self model tokens
]

{ #category : #'integer tokens' }
OPPetriNetPlaceSimulator >> tokensAmount: anInteger [
	self model tokens: anInteger
]
