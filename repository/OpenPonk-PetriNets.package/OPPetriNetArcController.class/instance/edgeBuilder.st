hooks
edgeBuilder
	^ OPRTEdgeBuilder new
		head: self headShapeClass;
		borderAttachPoint;
		constraintLabel: #name balance: 0.4 offset: 12;
		yourself