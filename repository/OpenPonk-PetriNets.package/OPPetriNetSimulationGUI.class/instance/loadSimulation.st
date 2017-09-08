private - hooks
loadSimulation
	"prepares simulation - called with every reload"

	super loadSimulation.
	diagramSimulator
		simulableElementsDo: [ :element | 
			element
				when: OPSimulatorDidAction
				do: [ :event | 
					event index = 2
						ifTrue: [ 
							| controller prevColor |
							controller := self diagramController controllerForModel: event simulator model.
							prevColor := controller figure color.
							controller figure color: Color lightBlue.
							controller refreshFigure.
							[ 
							(Delay forMilliseconds: 200) wait.
							controller figure color = prevColor
								ifFalse: [ 
									controller figure color: Color transparent.
									controller refreshFigure ] ] fork ] ] ]