private - hooks
loadController
	"creates simulator for current diagramController and sets visualisation of steping"

	super loadController.
	diagramSimulator
		simulableElementsDo: [ :element | 
			element
				when: DCSimulatorDidAction
				do: [ :event | 
					event index = 2
						ifTrue: [ 
							| controller prevColor |
							controller := self controller controllerForModel: event simulator model.
							prevColor := controller figure color.
							controller figure color: Color lightBlue.
							controller refreshFigure.
							[ 
							(Delay forMilliseconds: 200) wait.
							controller figure color = prevColor
								ifFalse: [ 
									controller figure color: Color transparent.
									controller refreshFigure ] ] fork ] ] ]