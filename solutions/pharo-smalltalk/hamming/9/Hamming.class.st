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
	
   size1 = size2 ifFalse: [ SizeMismatch signal: (self sizeMismatchMessageStringFor: size1 and: size2) ].

	^ size1 - (strand1 howManyMatch: strand2)
	
]

{ #category : 'error handling' }
Hamming >> sizeMismatchMessageStringFor: size1 and: size2 [
	size1 isZero ifTrue: [ ^ 'left strand must not be empty' ].
	size2 isZero ifTrue: [ ^ 'right strand must not be empty' ].
	^ 'left and right strands must be of equal length'
]
