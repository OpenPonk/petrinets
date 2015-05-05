private - hooks
buttonItems
	^ super buttonItems
		add: [ :item | 
					item
						name: 'Step all';
						description: 'Step all enabled elements once';
						action: [ 
									self simulator
										setSteppingAll;
										step;
										setDefaultStepping ] ];
		add: [ :item | 
					item
						name: 'Step';
						description: 'Step random element once';
						action: [ self simulator step ] ];
		add: [ :item | 
					item
						name: 'Run';
						description: 'Step random element every second';
						action: [ self simulator repeat ] ];
		add: [ :item | 
					item
						name: 'Stop';
						description: 'Stop stepping';
						action: [ self simulator stop ] ];
		yourself