examples
exampleEmpty
	| project diagram |
	project := OPProject named: 'New BC Petri Net'.
	diagram := OPBCPetriNet new name: 'New BC Petri Net Diagram'.
	project addModel: diagram.
	OPWorkbench openProject: project