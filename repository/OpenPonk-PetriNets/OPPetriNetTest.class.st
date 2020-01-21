"
A DCPetriNetTest is a test class for testing the behavior of DCPetriNet
"
Class {
	#name : #OPPetriNetTest,
	#superclass : #OPModelObjectTest,
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #tests }
OPPetriNetTest >> testAdd [
	| d first second t |
	super testAdd.
	self setUp.
	
	d := OPPetriNet new.
	self assert: d elements isEmpty.

	first := OPPetriNetTransition new name: '1'.
	d add: first.
	second := OPPetriNetPTPlace new name: '2'.
	d add: second.
	self assert: d elements size = 2.
	self assert: d elements first owner = d.

	t := OPPetriNetNormalArc from: d elements first to: d elements second.
	d add: t.
	self assert: d elements size = 3.
	self assert: d elements third owner = d
]

{ #category : #tests }
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

	self assert: diagram elements size = 9.
	diagram remove: place1.
	self assert: diagram elements size = 7.
	diagram remove: arc2.
	self assert: diagram elements size = 6.
	diagram remove: trans.
	self assert: diagram elements size = 3.

	trans := OPPetriNetTransition new.
	diagram add: trans.
	self assert: diagram elements size = 4.
	diagram add: (OPPetriNetNormalArc from: trans to: place4).
	self assert: diagram elements size = 5.
	diagram removeAll.
	self assert: diagram elements size = 0
]
