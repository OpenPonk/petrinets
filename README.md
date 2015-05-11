# dynacase-petrinets
Petri nets diagrams for DynaCASE tool

## For read-only usage
Copy code at the bottom into Pharo then run it without any modification.
## For development
- 1)
You need to clone local git repository  
(make sure it's `git@github` and not `https://...`)
```
git clone git@github.com:bliznjan/dynacase-petrinets.git /my/path/to/dynacase-petrinets
```

- 2)
Copy following code into Pharo, uncomment any of 4 lines with paths (even more of them), modify paths of uncommented lines, then run whole code.

## Code for loading into Pharo
```
	| localPetriNetsPath localSimulationPath localDynacasePath localDynacaseModelPath |
	localPetriNetsPath := localSimulationPath := localDynacasePath := localDynacaseModelPath := nil.


" PART TO MODIFY "

  "for read-only usage without git: do not modify anything and just run it
    ..OR..
   for using local git clone: uncomment any lines and write own path to repository (last part of path has to be /repository)
	    you can choose each repository/line separately"
	
"dynacase-petrinets:"  "localPetriNetsPath = 'C:/Users/User/Pharo/repo/dynacase-petrinets/repository'."
"dynacase-simulation:"  "localSimulationPath = 'C:/Users/User/Pharo/repo/dynacase-simulation/repository'."
"dynacase:"  "localDynacasePath = 'C:/Users/User/Pharo/repo/dynacase/repository'."
"dynacase-model:"  "localDynacaseModelPath = 'C:/Users/User/Pharo/repo/dynacase-model/repository'."
		
" END OF PART TO MODIFY"		
		
	localPetriNetsPath notNil | localSimulationPath notNil | localDynacasePath notNil | localDynacaseModelPath notNil
		ifTrue: [ 
			Gofer new
				url: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main';
				configurationOf: 'GitFileTree';
				loadDevelopment ].
	localDynacaseModelPath
		ifNotNil: [ 
			Metacello new
				baseline: 'DynaCASEModel';
				repository: 'gitfiletree:///',localDynacaseModelPath;
				lock ].
	localDynacasePath
		ifNotNil: [ 
			Metacello new
				baseline: 'DynaCASE';
				repository: 'gitfiletree:///',localDynacasePath;
				lock ].
	localSimulationPath
		ifNotNil: [ 
			Metacello new
				baseline: 'DynaCASESimulation';
				repository: 'gitfiletree:///',localSimulationPath;
				lock ].
	localSimulationPath
		ifNotNil: [ 
			Metacello new
				baseline: 'DynaCASESimulationGUI';
				repository: 'gitfiletree:///',localSimulationPath;
				lock ].
	Metacello new
		baseline: 'DynaCASEPetriNets';
		repository:
				(localPetriNetsPath ifNotNil: [ 'gitfiletree:///',localPetriNetsPath ] ifNil: [ 'github://bliznjan/dynacase-petrinets/repository' ]);
		onConflict: [ :ex | ex allow ];
		onLock: [ :ex | ex disallow ];
		load
```

Windows note: Use forward slashes (/) even on Windows. For example
```
    repository: 'gitfiletree:///C:/Users/Username/Pharo/dynacase-petrinets/repository';
```
