hooks
connectionFeedback
	^ DCInteractiveLine new
		lineBuilder: [ :fromFigure :toFigure | self createRoassalShape edgeFrom: fromFigure to: toFigure ];
		from: source figure