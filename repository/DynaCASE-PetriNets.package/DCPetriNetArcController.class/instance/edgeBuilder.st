hooks
edgeBuilder
	^ DCRTEdgeBuilder new
		head: self headShapeClass;
		rectangleAttachPoint;
		constraintLabel: #name balance: 0.4 offset: 12;
		yourself