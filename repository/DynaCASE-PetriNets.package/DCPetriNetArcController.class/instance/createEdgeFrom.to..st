hooks
createEdgeFrom: fromFigure to: toFigure
	^ DCRTCallbackBuilder
		block: [ :view | 
			DCRTEdgeBuilder new
				head: self headShape;
				constraintLabel: #name balance: 0.5 offset: 12;
				createFigureFrom: fromFigure to: toFigure view: view ]