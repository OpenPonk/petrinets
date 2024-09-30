Class {
	#name : 'OPPetriNetPTPlace',
	#superclass : 'OPPetriNetAbstractPlace',
	#instVars : [
		'capacity'
	],
	#category : 'OpenPonk-PetriNets-Models',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Models'
}

{ #category : 'accessing' }
OPPetriNetPTPlace >> addToken [
	"adds one token"

	self addTokens: 1
]

{ #category : 'accessing' }
OPPetriNetPTPlace >> addTokens: aNumber [
	"adds aNumber amount of tokens"

	self tokens: tokens + aNumber
]

{ #category : 'accessing' }
OPPetriNetPTPlace >> capacity [
	^ capacity
]

{ #category : 'accessing' }
OPPetriNetPTPlace >> capacity: aNumber [
	capacity := aNumber
]

{ #category : 'initialization' }
OPPetriNetPTPlace >> initialize [
	super initialize.
	capacity := SmallInteger maxVal. "cannot use infinity, because it cannot be easily transformed to STON"
	self removeTokens
]

{ #category : 'accessing' }
OPPetriNetPTPlace >> noCapacity [
	self capacity: SmallInteger maxVal "cannot use infinity, because it cannot be easily transformed to STON"
]

{ #category : 'accessing' }
OPPetriNetPTPlace >> removeToken [
	"removes one token"

	self removeTokens: 1
]

{ #category : 'accessing' }
OPPetriNetPTPlace >> removeTokens [
	"removes all tokens"

	self tokens: 0
]

{ #category : 'accessing' }
OPPetriNetPTPlace >> removeTokens: aNumber [
	"removes aNumber amount of tokens"

	self tokens: tokens - aNumber
]

{ #category : 'accessing' }
OPPetriNetPTPlace >> tokens [
	"amount of tokens"

	^ tokens
]

{ #category : 'accessing' }
OPPetriNetPTPlace >> tokens: aNumber [
	"sets amount of tokens to aNumber"

	self assert: aNumber >= 0 description: 'Amount of tokens cannot be negative'.
	aNumber > self capacity
		ifTrue: [ OPPetriNetPlaceOverCapacity signalPlace: self ].
	tokens := aNumber.
	self announce: (OPPlaceTokensChanged element: self)
]
