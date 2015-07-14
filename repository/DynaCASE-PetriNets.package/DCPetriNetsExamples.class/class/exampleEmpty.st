examples
exampleEmpty
	| project diagram |
	project := DCProject named: 'New Petri Net'.
	diagram := DCPetriNet new name: 'New Petri Net Diagram'.
	project addDiagram: diagram.
	DCWorkbench openProject: project