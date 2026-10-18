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

{ #category : 'as yet unclassified' }
Raindrop >> withFactor: aNumber andSound: aString [
	factor := aNumber.
	sound := aString
]
