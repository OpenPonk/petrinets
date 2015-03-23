hooks
createEdgeFrom: fromFigure to: toFigure
	| builder label edge |
	^ DCRTCallbackBuilder
		block: [ :view | 
			builder := DCRTEdgeBuilder new.
			edge := builder createEdgeFrom: fromFigure to: toFigure head: self roassalShape head.
			view add: edge.
			label := builder addLabelNamed: #name to: edge.
			builder constraint: label balance: 0.5 offset: 12.
			edge ]