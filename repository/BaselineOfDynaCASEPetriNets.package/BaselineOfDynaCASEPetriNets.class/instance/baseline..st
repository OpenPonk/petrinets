accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec baseline: 'DynaCASE' with: [ spec repository: 'github://dynacase/dynacase/repository' ].
			spec baseline: 'DynaCASESimulation' with: [ spec repository: 'github://bliznjan/dynacase-simulation/repository' ].
			spec package: 'DynaCASE-PetriNets' with: [ spec requires: #('DynaCASE' 'DynaCASESimulation') ].
			spec group: 'default' with: #('DynaCASE-PetriNets') ]