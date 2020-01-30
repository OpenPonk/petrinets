Class {
	#name : #OPPetriNetLayouter,
	#superclass : #OPLayouter,
	#category : #'OpenPonk-PetriNets-Adapters'
}

{ #category : #accessing }
OPPetriNetLayouter >> allEdges [
	^ diagramController controllers
		select: [ :ctrl | ctrl isKindOf: OPPetriNetArcController ]
		thenCollect: #figure
]

{ #category : #accessing }
OPPetriNetLayouter >> allNodes [
	^ diagramController controllers
		select: [ :ctrl | ctrl isKindOf: OPPetriNetNodeController ]
		thenCollect: #figure
]

{ #category : #layouts }
OPPetriNetLayouter >> defaultLayout [
	self sugiyamaLayout
]
