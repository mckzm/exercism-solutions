Class {
	#name : 'Raindrops',
	#superclass : 'Object',
	#instVars : [
		'raindrops'
	],
	#category : 'Exercise@Raindrops',
	#package : 'Exercise@Raindrops'
}

{ #category : 'as yet unclassified' }
Raindrops >> convertNumber: aNumber [
	^ (String streamContents: [ :s |
		raindrops do: [ :each |
			s nextPutAll: (each soundFor: aNumber)
			] ]) ifEmpty: [ aNumber asString ]
]

{ #category : 'initialization' }
Raindrops >> initialize [
	raindrops := {
		Raindrop new withFactor: 3 andSound: 'Pling'.
		Raindrop new withFactor: 5 andSound: 'Plang'.
		Raindrop new withFactor: 7 andSound: 'Plong'
	}
]
