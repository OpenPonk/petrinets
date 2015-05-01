private - hooks
buttonItems
	^ super buttonItems
		add: [ :item | 
					item
						name: 'Step';
						description: 'Step once';
						action: [ self simulator step ] ];
		add: [ :item | 
					item
						name: 'Run';
						description: 'Step every second';
						action: [ self simulator repeat ] ];
		add: [ :item | 
					item
						name: 'Fast forward';
						description: 'Keeps stepping without delay';
						action: [ self simulator repeatWithoutDelay ] ];
		add: [ :item | 
					item
						name: 'Stop';
						description: 'Stop stepping';
						action: [ self simulator stop ] ];
		yourself