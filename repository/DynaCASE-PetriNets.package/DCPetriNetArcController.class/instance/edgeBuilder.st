hooks
edgeBuilder
	^ DCRTEdgeBuilder new
		head: self headShape;
		constraintLabel: #name balance: 0.4 offset: 12;
		yourself