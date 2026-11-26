"
I represent a throw of 0+ dice, themselves represented by Die objects.
"
Class {
	#name : 'DieHandle',
	#superclass : 'Object',
	#instVars : [
		'dice'
	],
	#category : 'Exercise@Die',
	#package : 'Exercise@Die'
}

{ #category : 'arithmetic' }
DieHandle >> + anotherHandle [
	dice addAll: anotherHandle dice.
	^ self
]

{ #category : 'adding' }
DieHandle >> addDie: die [
	dice add: die
]

{ #category : 'accessing' }
DieHandle >> dice [
	^ dice
]

{ #category : 'as yet unclassified' }
DieHandle >> diceNumber [
	^ dice size
]

{ #category : 'initialization' }
DieHandle >> initialize [
	dice := OrderedCollection new
]

{ #category : 'as yet unclassified' }
DieHandle >> roll [
	^ dice inject: 0 into: [ :acc :die | acc + die roll ]
]
