menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'Petri Nets')
		icon: OPPetriNetsIcons current petriNetIcon;
		action: [ self exampleEmpty ];
		order: 25.715;
		with: [ (aBuilder item: #'Petri Nets Example')
				parent: #'Petri Nets';
				label: 'Petri Nets example';
				icon: OPPetriNetsIcons current petriNetIcon;
				action: [ self examplePetriNets ] ]