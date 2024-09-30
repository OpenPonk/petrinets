Class {
	#name : 'OPPetriNetLayouter',
	#superclass : 'OPLayouter',
	#category : 'OpenPonk-PetriNets-Adapters',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Adapters'
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
