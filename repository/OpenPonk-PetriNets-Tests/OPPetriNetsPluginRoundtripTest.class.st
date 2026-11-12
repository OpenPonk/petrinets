"
Verifies the serialization and deserialization roundtrip persistence for Petri Net models and diagrams.
"
Class {
	#name : 'OPPetriNetsPluginRoundtripTest',
	#superclass : 'OPAbstractPluginExampleRoundtripTest',
	#category : 'OpenPonk-PetriNets-Tests-Controllers',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPPetriNetsPluginRoundtripTest class >> pluginClass [
	^ OPPetriNetsPlugin
]
