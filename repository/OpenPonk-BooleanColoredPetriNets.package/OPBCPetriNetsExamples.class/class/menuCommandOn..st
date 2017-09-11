world menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'BC Petri Nets')
		icon: OPPetriNetsIcons current petriNetIcon;
		parent: #MostUsedTools;
		action: [ self exampleEmpty ];
		with: [ (aBuilder item: #'BC Petri Nets Example')
				parent: #'BC Petri Nets';
				label: 'BC Petri Nets example';
				icon: OPPetriNetsIcons current petriNetIcon;
				action: [ self examplePetriNets ] ]