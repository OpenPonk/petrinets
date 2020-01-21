Class {
	#name : #BaselineOfPetriNets,
	#superclass : #BaselineOf,
	#category : 'BaselineOfPetriNets'
}

{ #category : #accessing }
BaselineOfPetriNets >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonkSimulation'
				with: [ spec repository: 'github://JanBliznicenko/openponk-simulation/repository' ].
			spec package: 'OpenPonk-PetriNets' with: [ spec requires: #('OpenPonkSimulation') ].
			spec package: 'OpenPonk-BooleanColoredPetriNets' with: [ spec requires: #('OpenPonk-PetriNets') ].
			spec group: 'default' with: #('OpenPonk-PetriNets').
			spec group: 'bcpn' with: #('OpenPonk-BooleanColoredPetriNets') ]
]
