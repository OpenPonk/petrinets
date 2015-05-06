removing
dependentElements
	^ OrderedCollection new
		addAll: incoming;
		addAll: outgoing;
		yourself