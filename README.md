# openponk-petrinets
Petri nets diagrams for OpenPonk tool

## For read-only usage
Copy code at the bottom into Pharo then run it without any modification.
## For development
- 1)
You need GIT to clone local git repository with following line:
```
git clone git@github.com:bliznjan/openponk-petrinets.git /YOUR/TARGET/PATH
```

- 2)
Copy following code into Pharo, uncomment any of lines with paths, modify paths of uncommented lines, then run whole code.

## Code for loading into Pharo
```
    | localPaths |
    localPaths := Dictionary new.

" PART TO MODIFY "

  "comment lines with modules you do not want to load"
    localPaths at: #BormEditor put: 'github://openponk/borm-editor/repository'.
    localPaths at: #DemoEditor put: 'github://openponk/demo-editor/repository'.
    localPaths at: #UmlClassEditor put: 'github://openponk/class-editor/repository'.
    localPaths at: #OpenPonkSimulationGUI put: 'github://bliznjan/openponk-simulation/repository'.
    localPaths at: #OpenPonkPetriNets put: 'github://bliznjan/openponk-petrinets/repository'.

  "for read-only usage without git: do not modify anything and just run it
    ..OR..
   if you want to load local git clone: uncomment lines with modules you want to load from local git clone
   and write your correct path to local git repository (last part of path has to be /repository)"
    "localPaths at: #OpenPonkModel put: 'gitfiletree://' , '/C:/YOUR/OWN/PATH/TO/openponk-model/repository'."
    "localPaths at: #OpenPonk put: 'gitfiletree://' , '/C:/YOUR/OWN/PATH/TO/openponk/repository'."
    "localPaths at: #BormModel put: 'gitfiletree://' , '/C:/YOUR/OWN/PATH/TO/borm-model/repository'."
    "localPaths at: #BormEditor put: 'gitfiletree://' , '/C:/YOUR/OWN/PATH/TO/borm-editor/repository'."
    "localPaths at: #DemoEditor put: 'gitfiletree://' , '/C:/YOUR/OWN/PATH/TO/demo-editor/repository'."
    "localPaths at: #UmlClassEditor put: 'gitfiletree://' , '/C:/YOUR/OWN/PATH/TO/class-editor/repository'."
    "localPaths at: #OpenPonkSimulation put: 'gitfiletree://' , '/C:/YOUR/OWN/PATH/TO/openponk-simulation/repository'."
    "localPaths at: #OpenPonkSimulationGUI put: 'gitfiletree://' , '/C:/YOUR/OWN/PATH/TO/openponk-simulation/repository'."
    "localPaths at: #OpenPonkPetriNets put: 'gitfiletree://' , '/C:/YOUR/OWN/PATH/TO/openponk-petrinets/repository'."

" END OF PART TO MODIFY "
    Metacello new
        baseline: 'FileTree';
        repository: 'github://dalehenrich/filetree:pharo' , SystemVersion
        current dottedMajorMinor , '_dev/repository';
        load: 'Git'.

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
    '/C:/Users/EXAMPLE/openponk-petrinets/repository'
```
