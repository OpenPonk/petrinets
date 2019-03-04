construction
showInDiagram: aDiagramController
	super showInDiagram: aDiagramController.
	model when: OPPlaceTokensChanged do: [ self refreshFigure ]