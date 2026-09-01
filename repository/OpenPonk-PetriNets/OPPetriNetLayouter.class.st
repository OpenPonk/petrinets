"
Applies automated layout algorithms to Petri Net diagrams, positioning nodes and routing arcs.
"
Class {
	#name : 'OPPetriNetLayouter',
	#superclass : 'OPNodesAndEdgesLayouter',
	#category : 'OpenPonk-PetriNets-ViewModels',
	#package : 'OpenPonk-PetriNets',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPPetriNetLayouter >> allEdges [

	^ diagramController controllers
		  select: [ :ctrl | ctrl isKindOf: OPPetriNetArcController ]
		  thenCollect: #roassalShape
]

{ #category : 'accessing' }
OPPetriNetLayouter >> allNodes [

	^ diagramController controllers
		  select: [ :ctrl | ctrl isKindOf: OPPetriNetNodeController ]
		  thenCollect: #roassalShape
]

{ #category : 'layouts' }
OPPetriNetLayouter >> defaultLayout [
	self sugiyamaLayout
]
