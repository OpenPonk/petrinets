accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec baseline: 'OpenPonkSimulationGUI' with: [ spec repository: 'github://bliznjan/openponk-simulation/repository' ].
			spec package: 'OpenPonk-PetriNets' with: [ spec requires: #('OpenPonkSimulationGUI') ].
			spec group: 'default' with: #('OpenPonk-PetriNets') ]