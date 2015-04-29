accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec baseline: 'DynaCASESimulationGUI' with: [ spec repository: 'github://bliznjan/dynacase-simulation/repository' ].
			spec package: 'DynaCASE-PetriNets' with: [ spec requires: #('DynaCASESimulationGUI') ].
			spec group: 'default' with: #('DynaCASE-PetriNets') ]