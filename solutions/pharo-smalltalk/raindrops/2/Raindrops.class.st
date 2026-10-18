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
	| s |
	s := raindrops inject: '' into: [ :acc :each |
		(aNumber % each factor = 0)
			ifTrue: [ acc, each sound ]
			ifFalse: [ acc ]
		].
	s ifNotEmpty: [ ^ s ].
	^ aNumber asString
]

{ #category : 'initialization' }
Raindrops >> initialize [
	raindrops := {
		Raindrop new withFactor: 3 andSound: 'Pling'.
		Raindrop new withFactor: 5 andSound: 'Plang'.
		Raindrop new withFactor: 7 andSound: 'Plong'
	}
]
