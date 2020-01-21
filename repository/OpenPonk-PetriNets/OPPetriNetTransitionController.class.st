Class {
	#name : #OPPetriNetTransitionController,
	#superclass : #OPPetriNetNodeController,
	#instVars : [
		'adornments'
	],
	#category : 'OpenPonk-PetriNets-Controllers'
}

{ #category : #'class initialization' }
OPPetriNetTransitionController class >> initializePossibleConnected [
	PossibleOutgoing := Set with: OPPetriNetNormalArcController
]

{ #category : #hooks }
OPPetriNetTransitionController >> createAdornment [
	| icon transitionHelper |
	transitionHelper := RTBox new
		size: 20;
		color: Color white;
		borderColor: Color veryVeryLightGray;
		element.
	(RTConstraint on: transitionHelper background: figure)
		bottom;
		right;
		outer;
		stick.
	icon := RTSVGPath new
		path: 'M-5,6 L-5,-6 L5,0 L-5,6';
		color: (Color red: 50 green: 190 blue: 30);
		element.
	(RTConstraint on: icon background: transitionHelper) stick.
	transitionHelper
		when: TRMouseLeftClick
		do: [ :evt | OPPetriNetSimulationGUI stepSimulatorOfController: self ].
	figure
		when: OPTRFocused
		do: [ figure view
				add: transitionHelper;
				add: icon ].
	figure
		when: OPTRUnfocused
		do: [ transitionHelper view
				ifNotNil: [ transitionHelper remove.
					icon remove ] ]
]

{ #category : #hooks }
OPPetriNetTransitionController >> createRoassalShape [
	^ RTBox new
		size: 35;
		color: Color transparent;
		borderColor: Color black;
		yourself
]

{ #category : #initialization }
OPPetriNetTransitionController >> initialize [
	super initialize.
	adornments := OrderedCollection new
]

{ #category : #hooks }
OPPetriNetTransitionController >> modelClass [
	^ OPPetriNetTransition
]

{ #category : #hooks }
OPPetriNetTransitionController >> refreshFigure [
	adornments ifEmpty: [ adornments add: self createAdornment ].
	super refreshFigure
]
