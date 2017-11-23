hooks
createAdornment
	| icon transitionHelper |
	transitionHelper := RTBox new
		size: 20;
		color: Color white;
		borderColor: Color veryVeryLightGray;
		element.
	(RTConstraint on: transitionHelper background: figure)
		bottom;
		right;
		outer;
		stick.
	icon := RTSVGPath new
		path: 'M-6,6 L-6,-6 L6,0 L-6,6';
		element.
	(RTConstraint on: icon background: transitionHelper) stick.
	transitionHelper
		when: TRMouseLeftClick
		do: [ :evt | OPPetriNetSimulationGUI stepSimulatorOfController: self ].
	figure
		when: OPTRFocused
		do: [ figure view
				add: transitionHelper;
				add: icon ].
	figure
		when: OPTRUnfocused
		do: [ transitionHelper view
				ifNotNil: [ transitionHelper remove.
					icon remove ] ]