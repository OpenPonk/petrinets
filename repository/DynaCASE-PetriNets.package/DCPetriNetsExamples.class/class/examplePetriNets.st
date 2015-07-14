examples
examplePetriNets
	| project model place1 arc1 arc2 arc3 arc4 arc5 place2 place3 place4 trans1 trans2 |
	project := DCProject named: 'Example Petri Net'.
	model := DCPetriNet named: 'Petri Net Diagram'.
	project addDiagram: model.
	place1 := (DCPetriNetPlace named: 'P1')
		tokens: 20;
		yourself.
	place2 := DCPetriNetPlace named: 'P2'.
	place3 := DCPetriNetPlace named: 'P3'.
	place4 := (DCPetriNetPlace named: 'P4')
		tokens: 1;
		yourself.
	trans1 := DCPetriNetTransition named: 'T1'.
	trans2 := DCPetriNetTransition named: 'T2'.
	model
		add: place1;
		add: place2;
		add: place3;
		add: place4;
		add: trans1;
		add: trans2.
	arc1 := DCPetriNetNormalArc from: place1 to: trans1.
	arc2 := DCPetriNetInhibitorArc from: place2 to: trans1.
	arc3 := DCPetriNetOutputArc from: trans1 to: place3.
	arc4 := DCPetriNetResetArc from: place4 to: trans1.
	arc5 := DCPetriNetOutputArc from: trans2 to: place4.
	model
		add: arc1;
		add: arc2;
		add: arc3;
		add: arc4;
		add: arc5.

	DCWorkbench openProject: project