actions
action
	self fireable
		ifTrue: [ 
			changes
				add: [ 
					incoming do: [ :arc | arc fire ].
					outgoing do: [ :arc | arc fire ] ] ]