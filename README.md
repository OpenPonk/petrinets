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
Copy following code into Pharo, uncomment any of lines with paths, modify paths of uncommented lines, then run whole code.

## Code for loading into Pharo
```
    | localPaths |
    localPaths := Dictionary new.
    localPaths at: #DynaCASE put: 'github://dynacase/dynacase/repository'.

" PART TO MODIFY "

  "comment lines with modules you do not want to load"
    localPaths at: #BormEditor put: 'github://dynacase/borm-editor/repository'.
    localPaths at: #DCUmlClassEditor put: 'github://dynacase/class-editor/repository'.
    localPaths at: #DynaCASESimulationGUI put: 'github://bliznjan/dynacase-simulation/repository'.
    localPaths at: #DynaCASEPetriNets put: 'github://bliznjan/dynacase-petrinets/repository'.

  "for read-only usage without git: do not modify anything and just run it
    ..OR..
   if you want to load local git clone: uncomment lines with modules you want to load from local git clone 
   and write your correct path to local git repository (last part of path has to be /repository)"
    "localPaths at: #DynaCASEModel put: 'filetree:///' , 'C:/YOUR/OWN/PATH/dynacase-model/repository'."
    "localPaths at: #DynaCASE put: 'filetree:///' , 'C:/YOUR/OWN/PATH/dynacase/repository'."
    "localPaths at: #BormModel put: 'filetree:///' , 'C:/YOUR/OWN/PATH/borm-model/repository'."
    "localPaths at: #BormEditor put: 'filetree:///' , 'C:/YOUR/OWN/PATH/borm-editor/repository'."
    "localPaths at: #DCUmlClassEditor put: 'filetree:///' , 'C:/YOUR/OWN/PATH/class-editor/repository'."
    "localPaths at: #DynaCASESimulation put: 'filetree:///' , 'C:/YOUR/OWN/PATH/dynacase-simulation/repository'."
    "localPaths at: #DynaCASESimulationGUI put: 'filetree:///' , 'C:/YOUR/OWN/PATH/dynacase-simulation/repository'."
    "localPaths at: #DynaCASEPetriNets put: 'filetree:///' , 'C:/YOUR/OWN/PATH/dynacase-petrinets/repository'."

" END OF PART TO MODIFY "        

    localPaths
		keysAndValuesDo:
				[ :eachName :eachPath | 
			Metacello new
				baseline: eachName;
				repository: eachPath;
				lock ];
		keysAndValuesDo:
				[ :eachName :eachPath | 
			Metacello new
				baseline: eachName;
				repository: eachPath;
				onConflict: [ :ex | ex allow ];
				onLock: [ :ex | ex disallow ];
				load ].
```

Windows note: Use forward slashes (/) even on Windows. For example
```
    'C:/Users/EXAMPLE/dynacase-petrinets/repository'
```
