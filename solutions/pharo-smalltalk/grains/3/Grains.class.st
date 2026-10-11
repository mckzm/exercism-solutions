"
I perform computations on the number of grains of wheat on a 64-square chessboard.

With the first square having 1 grain, and the number of grains doubling on each successive square, I can compute:
1) the number of grains on an arbitrary square
2) the total number of grains on the chessboard
"
Class {
	#name : 'Grains',
	#superclass : 'Object',
	#category : 'Exercise@Grains',
	#package : 'Exercise@Grains'
}

{ #category : 'computing' }
Grains >> atSquare: anInteger [
	(anInteger between: 1 and: 64) ifFalse: [ self error: 'square must be between 1 and 64' ].
	^ 1 bitShift: (anInteger - 1)
]

{ #category : 'computing' }
Grains >> total [
	^ (self atSquare: 64) * 2 - 1
]
