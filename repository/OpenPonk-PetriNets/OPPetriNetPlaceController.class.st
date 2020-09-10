Class {
	#name : #OPPetriNetPlaceController,
	#superclass : #OPPetriNetNodeController,
	#instVars : [
		'tokenGroup'
	],
	#category : #'OpenPonk-PetriNets-Controllers'
}

{ #category : #'class initialization' }
OPPetriNetPlaceController class >> initializePossibleConnected [
	PossibleOutgoing := Set
		with: OPPetriNetInhibitorArcController
		with: OPPetriNetNormalArcController
		with: OPPetriNetResetArcController
]

{ #category : #private }
OPPetriNetPlaceController >> applyTokenGroup [
	self createTokenGroup.
	tokenGroup view ifNotNil: [ ^ self ].
	(RTConstraint on: tokenGroup background: self figure)
		center;
		stick;
		move.
	self figure view add: tokenGroup.
	self figure
		addCallback: (TRRemoveCallback block: [ tokenGroup remove ])
]

{ #category : #hooks }
OPPetriNetPlaceController >> createRoassalShape [
	^ RTRoundedBox new
		size: 40;
		borderRadius: 20;
		color: Color transparent;
		borderColor: Color black;
		yourself
]

{ #category : #private }
OPPetriNetPlaceController >> createTokenGroup [
	| circle |
	tokenGroup ifNotNil: [ ^ self ].
	circle := RTEllipse new
		size: 12;
		color: Color black;
		elementOn: ''.
	tokenGroup := RTGroup with: circle
]

{ #category : #private }
OPPetriNetPlaceController >> refreshFigure [
	self tokenGroupFrom: self model tokens.
	^ super refreshFigure
]

{ #category : #private }
OPPetriNetPlaceController >> tokenCircle [
	"returns circle element representing presence of token(s)"

	^ self subclassResponsibility
]

{ #category : #private }
OPPetriNetPlaceController >> tokenGroup [
	self applyTokenGroup. "lazy initialization of token"
	^ tokenGroup
]

{ #category : #private }
OPPetriNetPlaceController >> tokenGroupFrom: aValue [
	self subclassResponsibility
]
