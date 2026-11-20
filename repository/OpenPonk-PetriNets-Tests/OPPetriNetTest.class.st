"
A DCPetriNetTest is a test class for testing the behavior of DCPetriNet
"
Class {
	#name : 'OPPetriNetTest',
	#superclass : 'OPModelObjectTest',
	#category : 'OpenPonk-PetriNets-Tests-Models',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Models'
}

{ #category : 'tests' }
OPPetriNetTest >> testAdd [

	| petriNet firstTransition secondPlace arc |
	super testAdd.

	petriNet := OPPetriNet new.
	self assertEmpty: petriNet elements.

	firstTransition := OPPetriNetTransition new name: '1'.
	petriNet add: firstTransition.
	secondPlace := OPPetriNetPTPlace new name: '2'.
	petriNet add: secondPlace.
	self assert: petriNet elements size equals: 2.
	self assert: petriNet elements first owner equals: petriNet.

	arc := OPPetriNetNormalArc from: petriNet elements first to: petriNet elements second.
	petriNet add: arc.
	self assert: petriNet elements size equals: 3.
	self assert: petriNet elements third owner equals: petriNet
]

{ #category : 'tests' }
OPPetriNetTest >> testComplexAddingRemoving [

	| place1 place2 place3 place4 trans arc1 arc2 arc3 arc4 |
	diagram := OPPetriNet new name: 'Diagram'.
	place1 := OPPetriNetPTPlace new tokens: 2.
	place2 := OPPetriNetPTPlace new.
	place3 := OPPetriNetPTPlace new.
	place4 := OPPetriNetPTPlace new tokens: 8.
	trans := OPPetriNetTransition new.
	diagram
		add: place1;
		add: place2;
		add: place3;
		add: place4;
		add: trans.

	arc1 := OPPetriNetNormalArc from: place1 to: trans.
	arc2 := OPPetriNetInhibitorArc from: place2 to: trans.
	arc3 := OPPetriNetNormalArc from: trans to: place3.
	arc4 := OPPetriNetResetArc from: place4 to: trans.
	diagram
		add: arc1;
		add: arc2;
		add: arc3;
		add: arc4.

	self assert: diagram elements size equals: 9.
	diagram remove: place1.
	self assert: diagram elements size equals: 7.
	diagram remove: arc2.
	self assert: diagram elements size equals: 6.
	diagram remove: trans.
	self assert: diagram elements size equals: 3.

	trans := OPPetriNetTransition new.
	diagram add: trans.
	self assert: diagram elements size equals: 4.
	diagram add: (OPPetriNetNormalArc from: trans to: place4).
	self assert: diagram elements size equals: 5.
	diagram removeAll.
	self assertEmpty: diagram elements
]

{ #category : 'tests' }
OPPetriNetTest >> testEmptyExampleModel [

	| emptyPetriNet |
	emptyPetriNet := OPPetriNetsExamples emptyModel.
	self assert: emptyPetriNet class identicalTo: OPPetriNet.
	self assert: emptyPetriNet name equals: 'New Petri Net'.
	self assertEmpty: emptyPetriNet elements
]

{ #category : 'tests' }
OPPetriNetTest >> testNodeTopologyWithoutOwnerAndRemovedFrom [

	| petriNet place transition incomingArc outgoingArc |
	place := OPPetriNetPTPlace named: 'P1'.
	self assertEmpty: place connected.
	self assertEmpty: place incoming.
	self assertEmpty: place outgoing.

	petriNet := OPPetriNet named: 'Net'.
	transition := OPPetriNetTransition named: 'T1'.
	incomingArc := OPPetriNetNormalArc from: transition to: place.
	outgoingArc := OPPetriNetNormalArc from: place to: transition.
	petriNet
		add: place;
		add: transition;
		add: incomingArc;
		add: outgoingArc.

	self should: [ place removedFrom: transition ] raise: AssertionFailure.

	place removedFrom: petriNet.
	self assert: place owner identicalTo: nil.
	self assert: incomingArc owner identicalTo: nil.
	self assert: outgoingArc owner identicalTo: nil.
	self assertEmpty: petriNet arcs.
	self assertEmpty: transition connected
]

{ #category : 'tests' }
OPPetriNetTest >> testPlaceTokensCapacityAndOverCapacityWarning [

	| place signaledPlace |
	place := OPPetriNetPTPlace named: 'P1'.
	self assert: place tokens equals: 0.

	place addToken.
	self assert: place tokens equals: 1.
	place addTokens: 4.
	self assert: place tokens equals: 5.
	place removeToken.
	self assert: place tokens equals: 4.
	place removeTokens: 2.
	self assert: place tokens equals: 2.

	self should: [ place removeTokens: 3 ] raise: AssertionFailure.
	self assert: place tokens equals: 2.

	place capacity: 3.
	signaledPlace := nil.
	[ place addTokens: 2 ]
		on: OPPetriNetPlaceOverCapacity
		do: [ :warning |
				signaledPlace := warning place.
				warning resume ].
	self assert: signaledPlace identicalTo: place.
	self assert: place tokens equals: 4.

	place noCapacity.
	self assert: place capacity equals: SmallInteger maxVal.
	place addTokens: 100.
	self assert: place tokens equals: 104
]

{ #category : 'tests' }
OPPetriNetTest >> testPlacesTransitionsAndTypePredicates [

	| petriNet place transition arc abstractNode |
	petriNet := OPPetriNet named: 'Net'.
	place := OPPetriNetPTPlace named: 'P1'.
	transition := OPPetriNetTransition named: 'T1'.
	arc := OPPetriNetNormalArc from: place to: transition.
	abstractNode := OPPetriNetNode new.
	petriNet
		add: place;
		add: transition;
		add: arc.

	self assertCollection: petriNet places hasSameElements: { place }.
	self assertCollection: petriNet transitions hasSameElements: { transition }.
	self assertCollection: petriNet nodes hasSameElements: {
			place.
			transition }.
	self assertCollection: petriNet arcs hasSameElements: { arc }.

	self assert: place isPlace description: 'Place must answer true to #isPlace'.
	self deny: place isTransition description: 'Place must answer false to #isTransition'.
	self deny: transition isPlace description: 'Transition must answer false to #isPlace'.
	self assert: transition isTransition description: 'Transition must answer true to #isTransition'.
	self deny: arc isPlace description: 'Arc must answer false to #isPlace'.
	self deny: arc isTransition description: 'Arc must answer false to #isTransition'.
	self deny: abstractNode isPlace description: 'Base node must answer false to #isPlace'.
	self deny: abstractNode isTransition description: 'Base node must answer false to #isTransition'
]
