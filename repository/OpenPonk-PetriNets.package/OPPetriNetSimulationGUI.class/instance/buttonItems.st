private - hooks
buttonItems
	^ super buttonItems
		add: [ :item | 
			item
				name: 'Pause';
				description: 'Pause stepping';
				action: [ self diagramSimulator stop ] ];
		add: [ :item | 
			item
				name: 'Run randomly';
				description: 'Step random element every second';
				action: [ self diagramSimulator repeat ] ];
		add: [ :item | 
			item
				name: 'Step random';
				description: 'Step random element once';
				action: [ self diagramSimulator step ] ];
		add: [ :item | 
			item
				name: 'Step all';
				description: 'Step all enabled elements once';
				action: [ self diagramSimulator
						setSteppingAll;
						step;
						setDefaultStepping ] ];
		yourself