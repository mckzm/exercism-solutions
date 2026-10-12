"
I can tell you the Hamming distance between two strings.
"
Class {
	#name : 'Hamming',
	#superclass : 'Object',
	#category : 'Exercise@Hamming',
	#package : 'Exercise@Hamming'
}

{ #category : 'comparing' }
Hamming >> distanceStrand1: strand1 strand2: strand2 [
	self validateSizeOfStrand1: strand1 isEqualToSizeOfStrand2: strand2.
	^ strand1 size - (strand1 howManyMatch: strand2)
	
]

{ #category : 'testing' }
Hamming >> validateSizeOfStrand1: strand1 isEqualToSizeOfStrand2: strand2 [
	strand1 size = strand2 size ifTrue: [ ^ self ].
	strand1 ifEmpty: [ HammingError raiseLeftEmptyStrand ].
	strand2 ifEmpty: [ HammingError raiseRightEmptyStrand ].
	HammingError raiseStrandsNotOfEqualLength
]
