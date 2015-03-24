accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec baseline: 'DynaCASE' with: [ spec repository: 'github://dynacase/dynacase/repository' ].
			spec baseline: 'DynaCASE-Simulation' with: [ spec repository: 'github://bliznjan/dynacase-simulation/repository' ].
			spec package: 'DynaCASE-PetriNets' with: [ spec requires: #('DynaCASE' 'DynaCASE-Simulation') ].
			spec group: 'default' with: #('DynaCASE-PetriNets') ]