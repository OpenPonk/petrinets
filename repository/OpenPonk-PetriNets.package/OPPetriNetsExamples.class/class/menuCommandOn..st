menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'OP Petri Nets')
		icon: OPPetriNetsIcons current petriNetIcon;
		parent: #MostUsedTools;
		action: [ self exampleEmpty ];
		with: [ 
					(aBuilder item: #'OP Petri Nets Example')
						parent: #'OP Petri Nets';
						label: 'OP Petri Nets';
						icon: OPPetriNetsIcons current petriNetIcon;
						action: [ self examplePetriNets ] ]