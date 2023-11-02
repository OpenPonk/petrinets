"
I simulate Petri net place element
"
Class {
	#name : #OPPetriNetPlaceSimulator,
	#superclass : #OPPetriNetNodeSimulator,
	#category : #'OpenPonk-PetriNets-Simulation'
}

{ #category : #'integer tokens' }
OPPetriNetPlaceSimulator >> addPetriNetTokens: anInteger [
	self petriNetTokens: self petriNetTokens + anInteger
]

{ #category : #testing }
OPPetriNetPlaceSimulator >> canReceivePetriNetTokens: anAmount [
	^ self petriNetTokens + anAmount <= self capacity
]

{ #category : #testing }
OPPetriNetPlaceSimulator >> canSendPetriNetTokens: anAmount [
	^ self petriNetTokens >= anAmount
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
OPPetriNetPlaceSimulator >> petriNetTokens [
	^ self model tokens
]

{ #category : #'integer tokens' }
OPPetriNetPlaceSimulator >> petriNetTokens: anInteger [
	self model tokens: anInteger
]

{ #category : #'integer tokens' }
OPPetriNetPlaceSimulator >> removePetriNetTokens: anInteger [
	self petriNetTokens: self petriNetTokens - anInteger
]
