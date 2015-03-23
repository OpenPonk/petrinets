menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'DynaCASE example Petri Nets')
		parent: #MostUsedTools;
		action: [ DCWorkbench examplePetriNets ]