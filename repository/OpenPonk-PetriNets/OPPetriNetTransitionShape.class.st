"
Diagram element representing a Petri Net transition.
Manages the rendering details, click interactions, and play triggers of its underlying Roassal shape.
"
Class {
	#name : 'OPPetriNetTransitionShape',
	#superclass : 'OPPetriNetNodeShape',
	#instVars : [
		'transitionHelper',
		'icon'
	],
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'accessing' }
OPPetriNetTransitionShape >> attachedShapes [

	^ super attachedShapes , {
		  icon.
		  transitionHelper }
]

{ #category : 'hooks' }
OPPetriNetTransitionShape >> playClicked [

	self announcer announce:
		(OPPetriNetPlayClicked forDiagramElement: self)
]

{ #category : 'removing' }
OPPetriNetTransitionShape >> removeRender [

	roassalShape ifNotNil: [ :shape |
			shape
				propertyAt: OPRSSelectable
				ifPresent: [ :selectableInteraction |
					selectableInteraction announcer unsubscribe: self ] ].
	super removeRender.
	icon := nil.
	transitionHelper := nil
]

{ #category : 'rendering' }
OPPetriNetTransitionShape >> renderBasicShape [

	^ RSBox new
		  size: 40;
		  borderColor: Color black;
		  yourself
]

{ #category : 'interactions' }
OPPetriNetTransitionShape >> selectableInteraction [

	| selectableInteraction removal |
	selectableInteraction := super selectableInteraction.
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
	transitionHelper
		when: RSMouseLeftClick
		do: [ self playClicked ]
		for: self.
	selectableInteraction
		when: RSHighlightEvent
		do: [
			roassalShape canvas
				add: transitionHelper;
				add: icon ]
		for: self.
	removal := [
	           transitionHelper remove.
	           icon remove ].
	selectableInteraction when: RSUnHighlightEvent do: removal for: self.
	^ selectableInteraction
]

{ #category : 'hooks' }
OPPetriNetTransitionShape >> whenPlayClickedSend: aSelector to: aReceiver [

	^ self announcer
		  when: OPPetriNetPlayClicked
		  send: aSelector
		  to: aReceiver
]
