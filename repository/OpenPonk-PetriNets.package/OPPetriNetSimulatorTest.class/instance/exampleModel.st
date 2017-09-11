hooks
exampleModel
	| model place1 arc1 arc2 arc3 arc4 place2 place3 place4 trans1 trans2 arc5 |
	model := OPPetriNet new name: 'Petri Net Diagram'.
	place1 := OPPetriNetPlaceWithTokens new
		name: 'P1';
		tokens: 20;
		yourself.
	place2 := OPPetriNetPlaceWithTokens new
		name: 'P2';
		yourself.
	place3 := OPPetriNetPlaceWithTokens new
		name: 'P3';
		yourself.
	place4 := OPPetriNetPlaceWithTokens new
		name: 'P4';
		tokens: 1;
		yourself.
	trans1 := OPPetriNetTransition new
		name: 'T1';
		yourself.
	trans2 := OPPetriNetTransition new
		name: 'T2';
		yourself.
	model
		add: place1;
		add: place2;
		add: place3;
		add: place4;
		add: trans1;
		add: trans2.
	arc1 := OPPetriNetNormalArc from: place1 to: trans1.
	arc2 := OPPetriNetInhibitorArc from: place2 to: trans1.
	arc3 := OPPetriNetNormalArc from: trans1 to: place3.
	arc4 := OPPetriNetResetArc from: place4 to: trans1.
	arc5 := OPPetriNetNormalArc from: trans2 to: place4.
	model
		add: arc1;
		add: arc2;
		add: arc3;
		add: arc4;
		add: arc5.
	^ model