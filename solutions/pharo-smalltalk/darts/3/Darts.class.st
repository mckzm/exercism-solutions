"
I can calculate the points scored in a single toss of a Darts game.
"
Class {
	#name : 'Darts',
	#superclass : 'Object',
	#category : 'Exercise@Darts',
	#package : 'Exercise@Darts'
}

{ #category : 'calculating' }
Darts >> scoreX: x y: y [
	| distanceToCenter |
	distanceToCenter := (x @ y) distanceTo: (0 @ 0).
	
	distanceToCenter <=1   ifTrue: [ ^ 10 ].
	distanceToCenter <= 5  ifTrue: [ ^  5 ].
	distanceToCenter <= 10 ifTrue: [ ^  1 ].
	^ 0.
]
