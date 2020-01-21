Class {
	#name : #OPBCPetriNetsNavigatorAdapter,
	#superclass : #OPNavigatorAdapter,
	#category : 'OpenPonk-BooleanColoredPetriNets-Adapters'
}

{ #category : #'widget API' }
OPBCPetriNetsNavigatorAdapter >> childrenMapping [
	^ {(OPBCPetriNet -> #nodes).
	(OPPetriNetNode -> #connected)}
]

{ #category : #'widget API' }
OPBCPetriNetsNavigatorAdapter >> contextMenuMapping [
	^ {}
]

{ #category : #'widget API' }
OPBCPetriNetsNavigatorAdapter >> displayMapping [
	^ {(OPBCPetriNet -> 'Diagram').
	(OPPetriNetArcWithExpression -> 'Arc').
	(OPPetriNetPlaceWithBooleanToken -> 'Place').
	(OPPetriNetTransition -> 'Transition')}
]

{ #category : #'widget API' }
OPBCPetriNetsNavigatorAdapter >> iconMapping [
	^ {(OPBCPetriNet -> OPPetriNetsIcons current petriNetIcon).
	(OPPetriNetArcWithExpression -> OPPetriNetsIcons current arcIcon).
	(OPPetriNetPlaceWithBooleanToken -> OPPetriNetsIcons current placeIcon).
	(OPPetriNetTransition -> OPPetriNetsIcons current transitionIcon)}
]
