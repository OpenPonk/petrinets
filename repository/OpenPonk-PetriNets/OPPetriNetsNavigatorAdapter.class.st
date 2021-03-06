Class {
	#name : #OPPetriNetsNavigatorAdapter,
	#superclass : #OPNavigatorAdapter,
	#category : #'OpenPonk-PetriNets-Adapters'
}

{ #category : #'widget API' }
OPPetriNetsNavigatorAdapter >> childrenMapping [
	^ {(OPPetriNet -> #nodes).
	(OPPetriNetNode -> #connected)}
]

{ #category : #'widget API' }
OPPetriNetsNavigatorAdapter >> displayMapping [
	^ {(OPPetriNet -> 'Model').
	(OPPetriNetInhibitorArc -> 'Inhibitor Arc').
	(OPPetriNetResetArc -> 'Reset Arc').
	(OPPetriNetWeightedArc -> 'Arc').
	(OPPetriNetPTPlace -> 'Place').
	(OPPetriNetTransition -> 'Transition')}
]

{ #category : #testing }
OPPetriNetsNavigatorAdapter >> hasMappingFor: anObject [
	^ {OPPetriNet.
	OPPetriNetArc.
	OPPetriNetNode} anySatisfy: [ :any | anObject isKindOf: any ]
]

{ #category : #'widget API' }
OPPetriNetsNavigatorAdapter >> iconMapping [
	^ {(OPPetriNet -> OPPetriNetsIcons current petriNetIcon).
	(OPPetriNetInhibitorArc -> OPPetriNetsIcons current inhibitorArcIcon).
	(OPPetriNetResetArc -> OPPetriNetsIcons current resetArcIcon).
	(OPPetriNetWeightedArc -> OPPetriNetsIcons current arcIcon).
	(OPPetriNetPTPlace -> OPPetriNetsIcons current placeIcon).
	(OPPetriNetTransition -> OPPetriNetsIcons current transitionIcon)}
]

{ #category : #private }
OPPetriNetsNavigatorAdapter >> sort: modelObjects [
	^ modelObjects
		sorted:
			[ :a :b | a name isNotNil and: [ b name isNil or: [ a name < b name ] ] ]
]

{ #category : #'widget API' }
OPPetriNetsNavigatorAdapter >> typesByDependency [
	^ {OPPetriNet.
	OPPetriNetNode.
	OPPetriNetArc}
]
