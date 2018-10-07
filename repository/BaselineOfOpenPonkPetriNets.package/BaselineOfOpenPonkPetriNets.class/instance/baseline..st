accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonkSimulationGUI'
				with: [ spec repository: 'github://JanBliznicenko/openponk-simulation/repository' ].
			spec package: 'OpenPonk-PetriNets' with: [ spec requires: #('OpenPonkSimulationGUI') ].
			spec package: 'OpenPonk-BooleanColoredPetriNets' with: [ spec requires: #('OpenPonk-PetriNets') ].
			spec group: 'pn' with: #('OpenPonk-PetriNets').
			spec group: 'default' with: #('pn' 'OpenPonk-BooleanColoredPetriNets') ]