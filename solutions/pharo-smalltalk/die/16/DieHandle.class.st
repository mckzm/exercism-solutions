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

{ #category : 'asserting' }
DieHandle class >> assertValidDiceCollection: diceCollection [
	(diceCollection class = OrderedCollection)
		ifFalse: [ DomainError signal: (
			'A DieHandle must be created with an OrderedCollection of Die objects, instead I got: {1}'
				format: { diceCollection } ) ]
]

{ #category : 'instance creation' }
DieHandle class >> withDiceCollection: diceCollection [
	self assertValidDiceCollection: diceCollection.
	^ self basicNew initializeWithDiceCollection: diceCollection copy
]

{ #category : 'combining' }
DieHandle >> + anotherHandle [
	^ self class withDiceCollection: dice, anotherHandle dice
]

{ #category : 'adding' }
DieHandle >> addDice: someDice [
	someDice do: [ :die | self addDie: die ]
]

{ #category : 'adding' }
DieHandle >> addDie: die [
	dice add: die
]

{ #category : 'accessing' }
DieHandle >> dice [
	^ dice
]

{ #category : 'accessing - computed' }
DieHandle >> diceNumber [
	^ dice size
]

{ #category : 'initialization' }
DieHandle >> initialize [
	dice := OrderedCollection new
]

{ #category : 'initialization' }
DieHandle >> initializeWithDiceCollection: diceCollection [
	dice := diceCollection
]

{ #category : 'action' }
DieHandle >> roll [
	^ dice inject: 0 into: [ :acc :die | acc + die roll ]
]
