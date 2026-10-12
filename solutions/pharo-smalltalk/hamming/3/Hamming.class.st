Class {
	#name : 'Hamming',
	#superclass : 'Object',
	#category : 'Exercise@Hamming',
	#package : 'Exercise@Hamming'
}

{ #category : 'computing' }
Hamming >> distanceStrand1: left strand2: right [
   left size = right size ifFalse: [ 
		left isEmpty ifTrue: [ ^ self error: 'left strand must not be empty' ].
		right isEmpty ifTrue: [ ^ self error: 'right strand must not be empty' ].
		^ self error: 'left and right strands must be of equal length'
	 ].
	^ (left asArray with: right asArray collect: [ :c1 :c2 | (c1 ~= c2) asInteger ]) sumNumbers.
	
]
