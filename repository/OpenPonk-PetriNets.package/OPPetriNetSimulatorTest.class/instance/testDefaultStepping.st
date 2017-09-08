tests
testDefaultStepping
	| items item stepped didAction |
	simulator setDefaultStepping.

	items := simulator itemsForAction.
	self assert: items size = 1.
	item := items first.
	self assert: item isSimulable.
	self assert: item isSteppable.
	self assert: (item isKindOf: OPPetriNetTransitionSimulator).

	stepped := OrderedCollection new.
	didAction := OrderedCollection new.
	simulator simulableElementsDo: [ :each | each when: OPSimulatorStepped do: [ :event | stepped add: event ] ].
	simulator simulableElementsDo: [ :each | each when: OPSimulatorDidAction do: [ :event | didAction add: event ] ].
	simulator step.
	self assert: stepped size = 1.
	self assert: didAction size = 2