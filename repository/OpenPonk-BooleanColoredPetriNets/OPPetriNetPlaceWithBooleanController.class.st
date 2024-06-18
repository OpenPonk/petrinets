Class {
	#name : 'OPPetriNetPlaceWithBooleanController',
	#superclass : 'OPPetriNetPlaceController',
	#category : 'OpenPonk-BooleanColoredPetriNets-Controllers',
	#package : 'OpenPonk-BooleanColoredPetriNets',
	#tag : 'Controllers'
}

{ #category : 'initialization' }
OPPetriNetPlaceWithBooleanController class >> initializePossibleConnected [
	PossibleOutgoing := Set with: OPPetriNetArcWithExpressionController
]

{ #category : 'forms' }
OPPetriNetPlaceWithBooleanController >> buildEditorForm: aForm [
	| existenceBox valueBox |
	super buildEditorForm: aForm.
	existenceBox := aForm addCheckbox: 'Has token'.
	valueBox := aForm addCheckbox: 'Token value'.
	existenceBox
		state: self model token isNotNil;
		whenChangedDo: [ :newValue | 
			self model
				token:
					(newValue
						ifTrue: [ valueBox state ]
						ifFalse: [ nil ]) ].
	valueBox
		state: (self model token ifNil: [ false ]);
		whenChangedDo: [ :newValue | 
			self model token: newValue.
			existenceBox state: true ]
]

{ #category : 'hooks' }
OPPetriNetPlaceWithBooleanController >> refreshFigure [
	self tokenGroupFrom: self model token.
	super refreshFigure
]

{ #category : 'private' }
OPPetriNetPlaceWithBooleanController >> tokenCircle [
	"returns circle element representing presence of token(s)"

	^ self tokenGroup first
]

{ #category : 'private' }
OPPetriNetPlaceWithBooleanController >> tokenGroupFrom: aValue [
	self tokenCircle
		color:
			(aValue
				ifNil: [ Color transparent ]
				ifNotNil: [ aValue
						ifTrue: [ Color black ]
						ifFalse: [ Color fromString: '#F0F0F0' ] ]).
	(aValue isNil or: [ aValue ])
		ifTrue: [ self tokenCircle trachelShape noBorder ]
		ifFalse: [ self tokenCircle trachelShape
				strokePaint: (Color fromString: '#303030') ].
	^ self tokenGroup
		translateBy: 0;
		yourself
]
