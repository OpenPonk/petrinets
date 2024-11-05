Class {
	#name : 'OPPetriNetPlaceShape',
	#superclass : 'OPPetriNetNodeShape',
	#instVars : [
		'tokenGroup'
	],
	#category : 'OpenPonk-PetriNets-Shapes',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Shapes'
}

{ #category : 'rendering' }
OPPetriNetPlaceShape >> addInteractions [

	super addInteractions.
	self addEventForwardingFrom: self tokenCircle to: self roassalShape
]

{ #category : 'accessing' }
OPPetriNetPlaceShape >> attachedShapes [

	^ super attachedShapes , { tokenGroup }
]

{ #category : 'private' }
OPPetriNetPlaceShape >> createTokenGroup [

	| circle |
	circle := RSCircle new
		          size: 12;
		          color: Color black;
		          yourself.
	^ tokenGroup := RSGroup with: circle
]

{ #category : 'removing' }
OPPetriNetPlaceShape >> removeRender [

	super removeRender.
	tokenGroup := nil
]

{ #category : 'hooks' }
OPPetriNetPlaceShape >> renderBasicShape [

	^ RSCircle new
		  size: 40;
		  borderColor: Color black;
		  yourself
]

{ #category : 'rendering' }
OPPetriNetPlaceShape >> renderShapeDetails [

	super renderShapeDetails.
	self canvas addAll: self createTokenGroup.
	RSLocation new stick: self tokenCircle on: self roassalShape
]

{ #category : 'private' }
OPPetriNetPlaceShape >> tokenCircle [
	"returns circle element representing presence of token(s)"

	^ self subclassResponsibility
]

{ #category : 'private' }
OPPetriNetPlaceShape >> tokenGroup [

	^ tokenGroup
]

{ #category : 'hooks' }
OPPetriNetPlaceShape >> updateRenderFromModel [

	self updateTokenAmount: self modelElement tokens.
	
	super updateRenderFromModel
]

{ #category : 'private' }
OPPetriNetPlaceShape >> updateTokenAmount: aValue [
	self subclassResponsibility
]
