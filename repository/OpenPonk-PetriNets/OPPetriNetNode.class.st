"
I represent non-edge element in Petri net
"
Class {
	#name : #OPPetriNetNode,
	#superclass : #OPModelObject,
	#category : 'OpenPonk-PetriNets-Models'
}

{ #category : #accessing }
OPPetriNetNode >> connected [
	owner ifNil: [ ^ #() ].
	^ owner arcs select: [ :each | each source = self or: [ each target = self ] ]
]

{ #category : #accessing }
OPPetriNetNode >> incoming [
	owner ifNil: [ ^ #() ].
	^ owner arcs select: [ :each | each target = self ]
]

{ #category : #testing }
OPPetriNetNode >> isArc [
	^ false
]

{ #category : #testing }
OPPetriNetNode >> isNode [
	^ true
]

{ #category : #testing }
OPPetriNetNode >> isPlace [
	^ false
]

{ #category : #testing }
OPPetriNetNode >> isTransition [
	^ false
]

{ #category : #accessing }
OPPetriNetNode >> outgoing [
	owner ifNil: [ ^ #() ].
	^ owner arcs select: [ :each | each source = self ]
]

{ #category : #accessing }
OPPetriNetNode >> relatedElements [
	^ (self incoming , self outgoing) asSet asOrderedCollection
]

{ #category : #removing }
OPPetriNetNode >> removedFrom: aDiagram [
	self
		removedFrom: aDiagram
		do: [ 
			self incoming do: [ :each | aDiagram remove: each ].
			self outgoing do: [ :each | aDiagram remove: each ] ]
]
