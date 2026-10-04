Class {
	#name : 'Darts',
	#superclass : 'Object',
	#category : 'Exercise@Darts',
	#package : 'Exercise@Darts'
}

{ #category : 'as yet unclassified' }
Darts >> scoreX: x y: y [
	| d |
	d := (x @ y) distanceTo: (0 @ 0).
	d <=1 ifTrue: [ ^ 10 ].
	d <= 5 ifTrue: [  ^ 5 ].
	d <= 10 ifTrue: [ ^ 1 ].
	^ 0.
]
