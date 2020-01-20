rendering
createEdgeFrom: fromElement to: toElement
	^ OPRTStyledMultiLine new
		head: self headShapeClass;
		withBorderAttachPoint;
		color: Color black;
		edgeFrom: fromElement to: toElement