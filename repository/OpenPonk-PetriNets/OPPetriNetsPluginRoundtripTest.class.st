"
Verifies the serialization and deserialization roundtrip persistence for Petri Net models and diagrams.
"
Class {
	#name : 'OPPetriNetsPluginRoundtripTest',
	#superclass : 'OPAbstractPluginExampleRoundtripTest',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPPetriNetsPluginRoundtripTest class >> pluginClass [
	^ OPPetriNetsPlugin
]
