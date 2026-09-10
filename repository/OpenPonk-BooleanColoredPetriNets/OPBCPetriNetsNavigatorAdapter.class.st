Class {
	#name : 'OPBCPetriNetsNavigatorAdapter',
	#superclass : 'OPNavigatorAdapter',
	#category : 'OpenPonk-BooleanColoredPetriNets-Adapters',
	#package : 'OpenPonk-BooleanColoredPetriNets',
	#tag : 'Adapters'
}

{ #category : 'widget API' }
OPBCPetriNetsNavigatorAdapter >> childrenMapping [
	^ {(OPBCPetriNet -> #nodes).
	(OPPetriNetNode -> #connected)}
]

{ #category : 'widget API' }
OPBCPetriNetsNavigatorAdapter >> contextMenuMapping [
	^ {}
]

{ #category : 'widget API' }
OPBCPetriNetsNavigatorAdapter >> displayMapping [
	^ {(OPBCPetriNet -> 'Diagram').
	(OPPetriNetArcWithExpression -> 'Arc').
	(OPPetriNetPlaceWithBooleanToken -> 'Place').
	(OPPetriNetTransition -> 'Transition')}
]

{ #category : 'widget API' }
OPBCPetriNetsNavigatorAdapter >> iconMapping [

	^ {
		  (OPBCPetriNet -> OPPetriNetsIcons petriNetIcon).
		  (OPPetriNetArcWithExpression -> OPPetriNetsIcons arcIcon).
		  (OPPetriNetPlaceWithBooleanToken -> OPPetriNetsIcons placeIcon).
		  (OPPetriNetTransition -> OPPetriNetsIcons transitionIcon) }
]
