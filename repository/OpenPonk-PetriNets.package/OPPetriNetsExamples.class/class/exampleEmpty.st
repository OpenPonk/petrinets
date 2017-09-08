examples
exampleEmpty
	| project diagram |
	project := OPProject named: 'New Petri Net'.
	diagram := OPPetriNet new name: 'New Petri Net Diagram'.
	project addModel: diagram.
	OPWorkbench openProject: project