"
DCPetriNetArc represents arc between a place and a transition
"
Class {
	#name : #OPPetriNetArc,
	#superclass : #OPDirectedAssociation,
	#category : 'OpenPonk-PetriNets-Models'
}

{ #category : #'instance creation' }
OPPetriNetArc class >> from: aSource to: aTarget [
	^ self new
		source: aSource;
		target: aTarget;
		yourself
]

{ #category : #testing }
OPPetriNetArc >> isArc [
	^ true
]

{ #category : #testing }
OPPetriNetArc >> isNode [
	^ false
]

{ #category : #testing }
OPPetriNetArc >> isPlace [
	^ false
]

{ #category : #testing }
OPPetriNetArc >> isTransition [
	^ false
]
