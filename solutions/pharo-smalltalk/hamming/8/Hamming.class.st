"
I can tell you the Hamming distance between two strings.
"
Class {
	#name : 'Hamming',
	#superclass : 'Object',
	#category : 'Exercise@Hamming',
	#package : 'Exercise@Hamming'
}

{ #category : 'computing' }
Hamming >> distanceStrand1: strand1 strand2: strand2 [
	| size1 size2 |
	size1 := strand1 size.
	size2 := strand2 size.
	
   size1 = size2 ifFalse: [ 
		strand1 isEmpty ifTrue: [ self error: 'left strand must not be empty' ].
		strand2 isEmpty ifTrue: [ self error: 'right strand must not be empty' ].
		self error: 'left and right strands must be of equal length'
	 ].

	^ size1 - (strand1 howManyMatch: strand2)
	
]
