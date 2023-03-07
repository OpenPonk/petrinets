Class {
	#name : #OPPetriNetPTPlaceShape,
	#superclass : #OPPetriNetPlaceShape,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #private }
OPPetriNetPTPlaceShape >> createTokenGroup [

	| label |
	super createTokenGroup.
	label := RSLabel new
		         color: Color black;
		         text: '';
		         yourself.
	tokenGroup add: label.
	RSLocation new
		outer;
		left;
		offset: -2 @ 0;
		stick: label on: tokenGroup first.
	^ tokenGroup
]

{ #category : #private }
OPPetriNetPTPlaceShape >> tokenCircle [
	"returns circle element representing presence of token(s)"

	^ self tokenGroup first
]

{ #category : #private }
OPPetriNetPTPlaceShape >> tokenLabel [
	"returns label element representing amount of tokens"

	^ self tokenGroup second
]

{ #category : #accessing }
OPPetriNetPTPlaceShape >> tokenText: aString [

	"sets token amount label text"

	self tokenLabel text: aString.
	self tokenCircle announce: (RSPositionChangedEvent new
			 oldPosition: self tokenCircle position;
			 newPosition: self tokenCircle position;
			 yourself)
]

{ #category : #private }
OPPetriNetPTPlaceShape >> updateTokenAmount: aNumber [

	"updates token shape and label to show aNumber amount of tokens"

	self tokenCircle color: (aNumber isZero
			 ifTrue: [ Color transparent ]
			 ifFalse: [ Color black ]).
	self tokenText: (aNumber < 2
			 ifTrue: [ '' ]
			 ifFalse: [ aNumber asString ]).
	^ self tokenCircle
]
