Class {
	#name : #OPPetriNetTransitionShape,
	#superclass : #OPPetriNetNodeShape,
	#instVars : [
		'playClickedBlock'
	],
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #'ston-core' }
OPPetriNetTransitionShape class >> stonAllInstVarNames [

	"Override to encode my instances using a custom set of instance variables or to define their order."

	^ super stonAllInstVarNames copyWithoutAll:
		  #( #playClickedBlock )
]

{ #category : #hooks }
OPPetriNetTransitionShape >> createRoassalShape [
	^ RSBox new
		size: 35;
		borderColor: Color black;
		yourself
]

{ #category : #hooks }
OPPetriNetTransitionShape >> initialize [

	super initialize.
	playClickedBlock := [  ]
]

{ #category : #hooks }
OPPetriNetTransitionShape >> playClicked [

	playClickedBlock value
]

{ #category : #hooks }
OPPetriNetTransitionShape >> setupHighlight: aHighlightable [

	| icon transitionHelper removal |
	super setupHighlight: aHighlightable.
	transitionHelper := RSBox new
		                    size: 20;
		                    color: Color white;
		                    borderColor: Color veryVeryLightGray;
		                    yourself.
	RSLocation new
		bottom;
		right;
		inner;
		offset: -1;
		stick: transitionHelper on: roassalShape.
	icon := RSSVGPath new
		        svgPath: 'M-5,6 L-5,-6 L5,0 L-5,6';
		        color: (Color red: 50 green: 190 blue: 30);
		        yourself.
	RSLocation new stick: icon on: transitionHelper.
	transitionHelper when: RSMouseLeftClick do: [ self playClicked ].
	aHighlightable when: RSHighlightEvent do: [ 
		roassalShape canvas
			add: transitionHelper;
			add: icon ].
	removal := [ 
	           transitionHelper remove.
	           icon remove ].
	aHighlightable when: RSUnHighlightEvent do: removal.
	roassalShape when: RSShapeRemovedEvent do: removal
]

{ #category : #hooks }
OPPetriNetTransitionShape >> whenPlayClickedDo: aBlock [

	playClickedBlock := aBlock
]
