tests
testSteppingAll
	| items stepped didAction |
	simulator setSteppingAll.
	
	items := simulator itemsForAction.
	self assert: items size = 2.
	self assert: (items allSatisfy: [ :item | item isSimulable ]).
	self assert: (items allSatisfy: [ :item | item isSteppable ]).
	self assert: (items allSatisfy: [ :item | item isKindOf: OPPetriNetTransitionSimulator ]).

	stepped := OrderedCollection new.
	didAction := OrderedCollection new.
	items do: [ :item | item when: OPSimulatorStepped do: [ :event | stepped add: event ] ].
	items do: [ :item | item when: OPSimulatorDidAction do: [ :event | didAction add: event ] ].
	simulator step.
	self assert: stepped size = 2.
	self assert: didAction size = 4