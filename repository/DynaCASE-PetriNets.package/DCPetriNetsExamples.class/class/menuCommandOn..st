menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'DC Petri Nets')
		icon: DCIcons current dcFsmDiagramIcon;
		parent: #MostUsedTools;
		action: [ self exampleEmpty ];
		with: [ 
					(aBuilder item: #'DC Petri Nets Example')
						parent: #'DC Petri Nets';
						label: 'DC Petri Nets';
						icon: DCIcons current dcFsmDiagramIcon;
						action: [ self examplePetriNets ] ]