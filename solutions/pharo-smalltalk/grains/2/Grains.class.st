Class {
	#name : 'Grains',
	#superclass : 'Object',
	#category : 'Exercise@Grains',
	#package : 'Exercise@Grains'
}

{ #category : 'accessing' }
Grains >> atSquare: anInteger [
	(anInteger between: 1 and: 64) ifFalse: [ self error: 'square must be between 1 and 64' ].
	^ 1 bitShift: (anInteger - 1)
]

{ #category : 'accessing' }
Grains >> total [
	^ (self atSquare: 64) * 2 - 1
]
