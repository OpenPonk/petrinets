private - hooks
buttonItems
	^ super buttonItems
		add:
			((self instantiate: ButtonModel)
				label: 'Pause';
				iconName: #testYellow;
				help: 'Pause stepping';
				action: [ self diagramSimulator stop ]);
		add:
			((self instantiate: ButtonModel)
				label: 'Play (random)';
				iconName: #smallPrintItIcon;
				help: 'Step random element every second';
				action: [ self diagramSimulator repeat ]);
		add:
			((self instantiate: ButtonModel)
				label: 'Step (random)';
				iconName: #forwardIcon;
				help: 'Step random element once';
				action: [ self diagramSimulator step ]);
		add:
			((self instantiate: ButtonModel)
				label: 'Step (all)';
				iconName: #glamorousThrough;
				help: 'Step all enabled elements once';
				action: [ self diagramSimulator
						setSteppingAll;
						step;
						setDefaultStepping ]);
		yourself