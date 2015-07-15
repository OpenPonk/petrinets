menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'DC Petri Nets')
		icon: DCPetriNetsIcons current petriNetIcon;
		parent: #MostUsedTools;
		action: [ self exampleEmpty ];
		with: [ 
					(aBuilder item: #'DC Petri Nets Example')
						parent: #'DC Petri Nets';
						label: 'DC Petri Nets';
						icon: DCPetriNetsIcons current petriNetIcon;
						action: [ self examplePetriNets ] ]