"
I can calculate the points scored in a single toss of a Darts game.
"
Class {
	#name : 'Darts',
	#superclass : 'Object',
	#instVars : [
		'target'
	],
	#category : 'Exercise@Darts',
	#package : 'Exercise@Darts'
}

{ #category : 'initialization' }
Darts >> initialize [
	target := Target new
]

{ #category : 'querying' }
Darts >> scoreX: x y: y [
	^ (target circles detect: [ :each | each containsPoint: x @ y ] ifNone: [ ^ 0 ]) score
]
