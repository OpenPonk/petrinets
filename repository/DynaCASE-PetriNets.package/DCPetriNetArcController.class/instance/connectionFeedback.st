hooks
connectionFeedback
	^ DCInteractiveLine new
		lineBuilder: [ :fromFigure :toFigure | self roassalShape edgeFrom: fromFigure to: toFigure ];
		from: source figure