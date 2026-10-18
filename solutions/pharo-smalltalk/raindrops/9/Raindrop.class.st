"
I map positive integer factors to their raindrop sound.
"
Class {
	#name : 'Raindrop',
	#superclass : 'Object',
	#instVars : [
		'factor',
		'sound'
	],
	#category : 'Exercise@Raindrops',
	#package : 'Exercise@Raindrops'
}

{ #category : 'accessing' }
Raindrop >> factor [
	^ factor
]

{ #category : 'accessing' }
Raindrop >> sound [
	^ sound
]

{ #category : 'private - transforming' }
Raindrop >> soundFor: aNumber [
	^ (aNumber isDivisibleBy: self factor)
			ifTrue: [ self sound ]
			ifFalse: [ '' ]
]

{ #category : 'initialization' }
Raindrop >> withFactor: aNumber andSound: aString [
	factor := aNumber.
	sound := aString
]
