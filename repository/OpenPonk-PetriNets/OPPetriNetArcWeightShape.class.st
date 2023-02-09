Class {
	#name : #OPPetriNetArcWeightShape,
	#superclass : #OPPetriNetArcLabel,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #'as yet unclassified' }
OPPetriNetArcWeightShape >> defaultAnchorConstraintPosition [

	^ OPRSAnchorConstraintBalancePosition balance: 0.7
]

{ #category : #accessing }
OPPetriNetArcWeightShape >> defaultText [

	| weight |
	weight := self owningElement modelElement weight.
	^ weight = 1
		  ifTrue: [ '' ]
		  ifFalse: [ 'weight: ' , weight asString ]
]
