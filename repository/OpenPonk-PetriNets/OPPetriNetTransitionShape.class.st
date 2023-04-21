Class {
	#name : #OPPetriNetTransitionShape,
	#superclass : #OPPetriNetNodeShape,
	#instVars : [
		'playClickedBlock'
	],
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

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
OPPetriNetTransitionShape >> renderBasicShape [

	^ RSBox new
		  size: 40;
		  borderColor: Color black;
		  yourself
]

{ #category : #hooks }
OPPetriNetTransitionShape >> setupHighlight: aHighlightable [

	| icon transitionHelper removal |
	super setupHighlight: aHighlightable.
	transitionHelper := RSBox new
		                    size: 18;
		                    color: Color transparent;
		                    yourself.
	RSLocation new
		bottom;
		right;
		inner;
		offset: -1;
		stick: transitionHelper on: roassalShape.
	icon := RSSVGPath new
		        svgPath: 'M-5,6 L-5,-6 L5,0 L-5,6';
		        color: (Color r: 0.2 g: 0.75 b: 0.1);
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
