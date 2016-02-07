# dynacase-petrinets
Petri nets diagrams for DynaCASE tool

## For read-only usage
Copy code at the bottom into Pharo then run it without any modification.
## For development
- 1)
You need GIT to clone local git repository with following line:
```
git clone git@github.com:bliznjan/dynacase-petrinets.git /my/path/to/dynacase-petrinets
```

- 2)
Copy following code into Pharo, uncomment any of lines with paths (even more of them), modify paths of uncommented lines, then run whole code.

## Code for loading into Pharo
```
    | localPetriNetsPath localSimulationPath localClassEditorPath localBormEditorPath localBormModelPath localDynacasePath localDynacaseModelPath |
    localPetriNetsPath := localSimulationPath := localClassEditorPath := localBormEditorPath := localBormModelPath := localDynacasePath := localDynacaseModelPath := nil.


" PART TO MODIFY "

  "for read-only usage without git: do not modify anything and just run it
    ..OR..
   for using local git clone: uncomment any of lines with paths and write own path to repository (last part of path has to be /repository)
        you can choose each repository/line separately"

"dynacase-petrinets:"
    localPetriNetsPath := 'C:/Users/EXAMPLE/Pharo/repo/dynacase-petrinets/repository'.
"dynacase-simulation:"
    localSimulationPath := 'C:/Users/EXAMPLE/Pharo/repo/dynacase-simulation/repository'.
"class-editor:"
    localClassEditorPath := 'C:/Users/EXAMPLE/Pharo/repo/class-editor/repository'.
"borm-editor:"
    localBormEditorPath := 'C:/Users/EXAMPLE/Pharo/repo/borm-editor/repository'.
"borm-model:"
    localBormModelPath := 'C:/Users/EXAMPLE/Pharo/repo/borm-model/repository'.
"dynacase:"
    localDynacasePath := 'C:/Users/EXAMPLE/Pharo/repo/dynacase/repository'.
"dynacase-model:"
    localDynacaseModelPath := 'C:/Users/EXAMPLE/Pharo/repo/dynacase-model/repository'.

" END OF PART TO MODIFY"        

    localDynacaseModelPath
        ifNotNil: [ 
            Metacello new
                baseline: 'DynaCASEModel';
                repository: 'filetree:///',localDynacaseModelPath;
                onLock: [ :ex | ex disallow ];
                lock;
                load ].
    localDynacasePath
        ifNotNil: [ 
            Metacello new
                baseline: 'DynaCASE';
                repository: 'filetree:///',localDynacasePath;
                onLock: [ :ex | ex disallow ];
                lock;
                load ].
    localBormModelPath
        ifNotNil: [ 
            Metacello new
                baseline: 'BormModel';
                repository: 'filetree:///',localBormModelPath;
                onLock: [ :ex | ex disallow ];
                lock;
                load ].
    localBormEditorPath
        ifNotNil: [ 
            Metacello new
                baseline: 'BormEditor';
                repository: 'filetree:///',localBormEditorPath;
                onLock: [ :ex | ex disallow ];
                lock;
                load ].
    localClassEditorPath
        ifNotNil: [ 
            Metacello new
                baseline: 'DCUmlClassEditor';
                repository: 'filetree:///',localClassEditorPath;
                onLock: [ :ex | ex disallow ];
                lock;
                load ].
    localSimulationPath
        ifNotNil: [ 
            Metacello new
                baseline: 'DynaCASESimulation';
                repository: 'filetree:///',localSimulationPath;
                onLock: [ :ex | ex disallow ];
                lock;
                load ].
    localSimulationPath
        ifNotNil: [ 
            Metacello new
                baseline: 'DynaCASESimulationGUI';
                repository: 'filetree:///',localSimulationPath;
                onLock: [ :ex | ex disallow ];
                lock;
                load ].
    localPetriNetsPath
        ifNotNil: [ 
            Metacello new
                baseline: 'DynaCASEPetriNets';
                repository: 'filetree:///',localPetriNetsPath;
                onLock: [ :ex | ex disallow ];
                lock;
                load ].
```

Windows note: Use forward slashes (/) even on Windows. For example
```
    repository: 'filetree:///C:/Users/EXAMPLE/Pharo/dynacase-petrinets/repository';
```
