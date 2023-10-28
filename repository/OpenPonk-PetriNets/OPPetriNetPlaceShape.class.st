Class {
	#name : #OPPetriNetPlaceShape,
	#superclass : #OPPetriNetNodeShape,
	#instVars : [
		'tokenGroup'
	],
	#category : #'OpenPonk-PetriNets-Shapes'
}

{ #category : #rendering }
OPPetriNetPlaceShape >> addInteractions [

	super addInteractions.
	self addEventForwardingFrom: self tokenCircle to: self roassalShape
]

{ #category : #private }
OPPetriNetPlaceShape >> createTokenGroup [

	| circle |
	circle := RSCircle new
		          size: 12;
		          color: Color black;
		          yourself.
	^ tokenGroup := RSGroup with: circle
]

{ #category : #hooks }
OPPetriNetPlaceShape >> renderBasicShape [

	^ RSCircle new
		  size: 40;
		  borderColor: Color black;
		  yourself
]

{ #category : #rendering }
OPPetriNetPlaceShape >> renderShapeDetails [

	super renderShapeDetails.
	self canvas addAll: self createTokenGroup.
	RSLocation new stick: self tokenCircle on: self roassalShape.
	self roassalShape
		when: RSShapeRemovedEvent
		do: [
			tokenGroup do: #remove.
			tokenGroup := nil ]
		for: self
]

{ #category : #private }
OPPetriNetPlaceShape >> tokenCircle [
	"returns circle element representing presence of token(s)"

	^ self subclassResponsibility
]

{ #category : #private }
OPPetriNetPlaceShape >> tokenGroup [

	tokenGroup ifNotNil: [ ^ tokenGroup ].

	self canvas addAll: self createTokenGroup.
	RSLocation new stick: self tokenCircle on: self roassalShape.
	self roassalShape
		when: RSShapeRemovedEvent
		do: [ tokenGroup do: #remove ].
	^ tokenGroup
]

{ #category : #hooks }
OPPetriNetPlaceShape >> updateRenderFromModel [

	self updateTokenAmount: self modelElement tokens.
	
	super updateRenderFromModel
]

{ #category : #private }
OPPetriNetPlaceShape >> updateTokenAmount: aValue [
	self subclassResponsibility
]
