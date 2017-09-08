examples
examplePetriNets
	| project model place1 arc1 arc2 arc3 arc4 arc5 place2 place3 place4 trans1 trans2 |
	project := OPProject named: 'Example Petri Net'.
	model := OPPetriNet named: 'Petri Net Diagram'.
	project addModel: model.
	place1 := (OPPetriNetPlace named: 'P1')
		tokens: 20;
		yourself.
	place2 := OPPetriNetPlace named: 'P2'.
	place3 := OPPetriNetPlace named: 'P3'.
	place4 := (OPPetriNetPlace named: 'P4')
		tokens: 1;
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

	OPWorkbench openProject: project