"
I can convert a number into the string representation of its raindrop sound, falling back to the string representation of the number itself if it has no associated raindrop sound.
"
Class {
	#name : 'Raindrops',
	#superclass : 'Object',
	#instVars : [
		'raindrops'
	],
	#category : 'Exercise@Raindrops',
	#package : 'Exercise@Raindrops'
}

{ #category : 'transformation' }
Raindrops >> convertNumber: aNumber [
	^ ('' join: (raindrops collect: [ :each |
		each soundFor: aNumber
		])) ifEmpty: [ aNumber asString ]
]

{ #category : 'initialization' }
Raindrops >> initialize [
	raindrops := {
		Raindrop new withFactor: 3 andSound: 'Pling'.
		Raindrop new withFactor: 5 andSound: 'Plang'.
		Raindrop new withFactor: 7 andSound: 'Plong'
	}
]
