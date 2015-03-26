*DynaCASE-PetriNets
examplePetriNets
	<example:'DynaCASE example Petri nets'>
	| project pn place1 arc1 arc2 place2 place3 trans arc3 |
	project := DCProject new projectName: 'Example Petri Net'.
	pn := DCPetriNet new name: 'Petri Net Diagram'.
	project addDiagram: pn.
	place1 := DCPetriNetPlace new tokens: 2.
	place2 := DCPetriNetPlace new.
	place3 := DCPetriNetPlace new.
	trans := DCPetriNetTransition new.
	pn
		add: place1;
		add: place2;
		add: place3;
		add: trans.
	arc1 := DCPetriNetNormalArc from: place1 to: trans.
	arc2 := DCPetriNetInhibitorArc from: place2 to: trans.
	arc3 := DCPetriNetNormalArc from: trans to: place3.
	pn
		add: arc1;
		add: arc2;
		add: arc3.
	^ self openProject: project