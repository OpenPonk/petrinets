Class {
	#name : #OPPetriNetsIcons,
	#superclass : #Object,
	#instVars : [
		'icons'
	],
	#classVars : [
		'Current'
	],
	#category : #'OpenPonk-PetriNets-Adapters'
}

{ #category : #'instance creation' }
OPPetriNetsIcons class >> current [
	^ Current ifNil: [ Current := self new ]
]

{ #category : #'accessing - icons' }
OPPetriNetsIcons >> arcIcon [
	"Private - Generated method"

	^ icons
		at: #arcIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self arcIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
OPPetriNetsIcons >> arcIconContents [
	"Private - Method generated with the content of the file File @ C:\Users\Ruiner\Pharo\images\DC-2015-07-15-roassal\icons\arc.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAApSURBVDhPYxgF9Af/oTRFAGQI1QwC
A5iJ5GKyAdmaKbKZIicPT8DAAADJtBfpwGY0agAAAABJRU5ErkJggg=='
]

{ #category : #'gt-inspector' }
OPPetriNetsIcons >> gtInspectorIconsIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list 
		title: 'Icons';
		display: [ 
			self iconSelectors asSortedCollection 
				collect: [ :each | each -> (self perform: each) ] ];
		icon: [ :each | each value ];
		format: [ :each | each key ]
]

{ #category : #initialization }
OPPetriNetsIcons >> iconSelectors [
	^ self class selectors select: [ :each | '*Icon' match: each asString ]
]

{ #category : #'accessing - icons' }
OPPetriNetsIcons >> inhibitorArcIcon [
	"Private - Generated method"

	^ icons
		at: #inhibitorArcIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self inhibitorArcIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
OPPetriNetsIcons >> inhibitorArcIconContents [
	"Private - Method generated with the content of the file File @ C:\Users\Ruiner\Pharo\images\DC-2015-07-15-roassal\icons\inhibitorArc.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAA1SURBVDhPYxgF9Af/kTDJAF0TSYbg
UgwWBxHEYGwAlzgGoNgAEEBXTJJmGABpguFRAAYMDACr7hjoX3/kFQAAAABJRU5ErkJggg=='
]

{ #category : #initialization }
OPPetriNetsIcons >> initialize [
	super initialize.
	self initializeIcons
]

{ #category : #initialization }
OPPetriNetsIcons >> initializeIcons [
	icons := LRUCache new 
		maximumWeight: 64;
		factory: [ :key | self perform: key ];
		yourself
]

{ #category : #'gt-inspector' }
OPPetriNetsIcons >> inspectionIcons [

	<inspectorPresentationOrder: 40 title: 'Icons'>
	<script: 'self current inspect'>
	| selectorsByForms |
	selectorsByForms := (self iconSelectors collect: [ :each | 
		                     ([ self perform: each ]
			                      on: Deprecation
			                      do: #resume) -> each ]) asDictionary.
	^ SpTablePresenter new
		  items:
			  (selectorsByForms keys sortedAs: [ :each | 
					   selectorsByForms at: each ]);
		  addColumn: (SpImageTableColumn new
				   title: 'Icon';
				   evaluated: [ :each | 
					   [ 
					   each scaledToSize:
							   (50 min: each width) @ (16 min: each height) ]
						   on: Deprecation
						   do: #resume ];
				   width: 50;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: [ :each | selectorsByForms at: each ];
				   yourself);
		  yourself
]

{ #category : #'accessing - icons' }
OPPetriNetsIcons >> petriNetIcon [
	"Private - Generated method"

	^ icons
		at: #petriNetIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self petriNetIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
OPPetriNetsIcons >> petriNetIconContents [
	"Private - Method generated with the content of the file File @ C:\Users\Ruiner\Pharo\images\DC-2015-07-15-roassal\icons\petriNet.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABNSURBVDhP3Y9RCgAgDEJ3/0sXBoNh
NlhBQQ/8SNSRES2oDJfKI+8HAEqubY7K4IPr97+AEitjynFBDbgns8rMFBlvaRLuLQdYGSFn
1gGjuDbKYn//LwAAAABJRU5ErkJggg=='
]

{ #category : #'accessing - icons' }
OPPetriNetsIcons >> placeIcon [
	"Private - Generated method"

	^ icons
		at: #placeIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self placeIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
OPPetriNetsIcons >> placeIconContents [
	"Private - Method generated with the content of the file File @ C:\Users\Ruiner\Pharo\images\DC-2015-07-15-roassal\icons\place.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABNSURBVDhP5Y1BCgAgCAT9/6cLA4Oy
tdWODXiJmU0ADRxFJIYj7C/QY2LDuZnYmE0lVp4HlNF+PLB0lRHXZEaOrj4yI1cPCddwx4Ig
FOlXnyvVPkOOFgAAAABJRU5ErkJggg=='
]

{ #category : #'accessing - icons' }
OPPetriNetsIcons >> placeWithTokenIcon [
	"Private - Generated method"

	^ icons
		at: #placeWithTokenIcon
		ifAbsentPut: [ Form
				fromBinaryStream:
					self placeWithTokenIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
OPPetriNetsIcons >> placeWithTokenIconContents [
	"Private - Method generated with the content of the file File @ C:\Users\Ruiner\Pharo\images\DC-2015-07-15-roassal\icons\placeWithToken.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABfSURBVDhPnY1RDsAwCEK9/6W70MRl
awVpX+KP8jAIg4yFCsoS9wvNOXKyZU/k5HVuZGAV4NbdaSDlnIq5V8fvVMw9OwIlg7ZA8fNu
SjbnpKTMYumUtDkWaMWVFIQY8QCOuTfJOVht4wAAAABJRU5ErkJggg=='
]

{ #category : #'accessing - icons' }
OPPetriNetsIcons >> resetArcIcon [
	"Private - Generated method"

	^ icons
		at: #resetArcIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self resetArcIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
OPPetriNetsIcons >> resetArcIconContents [
	"Private - Method generated with the content of the file File @ C:\Users\Ruiner\Pharo\images\DC-2015-07-15-roassal\icons\resetArc.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAA+SURBVDhPYxgFtAX/oTQywCaGE4AU
wzAMYBPDCZAVwzRgE8MQJBXjBNgUYhPDCbApxCaGE2BTRJTGkQUYGAC/Ny/RNQKItgAAAABJ
RU5ErkJggg=='
]

{ #category : #'accessing - icons' }
OPPetriNetsIcons >> transitionIcon [
	"Private - Generated method"

	^ icons
		at: #transitionIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self transitionIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
OPPetriNetsIcons >> transitionIconContents [
	"Private - Method generated with the content of the file File @ C:\Users\Ruiner\Pharo\images\DC-2015-07-15-roassal\icons\transition.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAiSURBVDhPY6AW+E8mhgMUDpFg1IBR
A0BgOBpADqYUMDAAAPLWM83NmmJrAAAAAElFTkSuQmCC'
]
