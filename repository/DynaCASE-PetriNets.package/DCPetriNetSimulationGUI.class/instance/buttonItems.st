private - hooks
buttonItems
	^ super buttonItems
		add: [ :item | 
					item
						name: 'Step all';
						description: 'Step all enabled elements once';
						action: [ 
									self diagramSimulator
										setSteppingAll;
										step;
										setDefaultStepping ] ];
		add: [ :item | 
					item
						name: 'Step';
						description: 'Step random element once';
						action: [ self diagramSimulator step ] ];
		add: [ :item | 
					item
						name: 'Run';
						description: 'Step random element every second';
						action: [ self diagramSimulator repeat ] ];
		add: [ :item | 
					item
						name: 'Stop';
						description: 'Stop stepping';
						action: [ self diagramSimulator stop ] ];
		yourself