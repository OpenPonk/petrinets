*DynaCASE-PetriNets
examplePetriNets
	<example: 'DynaCASE example Petri nets'>
	| project pn place1 arc1 arc2 arc3 arc4 place2 place3 place4 trans |
	project := DCProject new projectName: 'Example Petri Net'.
	pn := DCPetriNet new name: 'Petri Net Diagram'.
	project addDiagram: pn.
	place1 := DCPetriNetPlace new name: 'P1'; tokens: 2; yourself.
	place2 := DCPetriNetPlace new name: 'P2'; yourself.
	place3 := DCPetriNetPlace new name: 'P3'; yourself.
	place4 := DCPetriNetPlace new name: 'P4'; tokens: 8; yourself.
	trans := DCPetriNetTransition new name: 'T'; yourself.
	pn
		add: place1;
		add: place2;
		add: place3;
		add: place4;
		add: trans.
	arc1 := DCPetriNetNormalArc from: place1 to: trans.
	arc2 := DCPetriNetInhibitorArc from: place2 to: trans.
	arc3 := DCPetriNetOutputArc from: trans to: place3.
	arc4 := DCPetriNetResetArc from: place4 to: trans.
	pn
		add: arc1;
		add: arc2;
		add: arc3;
		add: arc4.
	^ self openProject: project