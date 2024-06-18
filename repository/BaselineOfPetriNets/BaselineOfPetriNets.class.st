Class {
	#name : 'BaselineOfPetriNets',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPetriNets',
	#package : 'BaselineOfPetriNets'
}

{ #category : 'accessing' }
BaselineOfPetriNets >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'OpenPonk'
			with: [ spec repository: 'github://openponk/openponk' ].
		spec baseline: 'OpenPonkSimulation' with: [
			spec
				repository: 'github://JanBliznicenko/openponk-simulation';
				loads: 'plugin' ].
		spec
			package: 'OpenPonk-PetriNets'
			with: [ spec requires: #( 'OpenPonkSimulation' ) ].
		spec
			package: 'OpenPonk-BooleanColoredPetriNets'
			with: [ spec requires: #( 'OpenPonk-PetriNets' ) ].
		spec
			group: 'plugin' with: #( 'OpenPonk-PetriNets' );
			group: 'default' with: #( 'OpenPonk' 'plugin' );
			group: 'bcpn' with: #( 'OpenPonk-BooleanColoredPetriNets' ) ]
]
