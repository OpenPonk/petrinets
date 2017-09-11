examples
examplePetriNets
	| project model place1 arc1 arc2 arc3 arc4 arc5 place2 place3 place4 trans1 trans2 |
	project := OPProject named: 'Example BC Petri Net'.
	model := OPBCPetriNet named: 'BC Petri Net Diagram'.
	project addModel: model.
	place1 := (OPPetriNetPlaceWithBooleanToken named: 'P1')
		token: true;
		yourself.
	place2 := OPPetriNetPlaceWithBooleanToken named: 'P2'.
	place3 := OPPetriNetPlaceWithBooleanToken named: 'P3'.
	place4 := (OPPetriNetPlaceWithBooleanToken named: 'P4')
		token: false;
		yourself.
	trans1 := OPPetriNetTransition named: 'T1'.
	trans2 := OPPetriNetTransition named: 'T2'.
	model
		add: place1;
		add: place2;
		add: place3;
		add: place4;
		add: trans1;
		add: trans2.
	arc1 := OPPetriNetArcWithExpression from: place1 to: trans1.
	arc2 := OPPetriNetArcWithExpression from: place2 to: trans1.
	arc3 := OPPetriNetArcWithExpression from: trans1 to: place3.
	arc4 := OPPetriNetArcWithExpression from: place4 to: trans1.
	arc5 := OPPetriNetArcWithExpression from: trans2 to: place4.
	model
		add: arc1;
		add: arc2;
		add: arc3;
		add: arc4;
		add: arc5.

	OPWorkbench openProject: project