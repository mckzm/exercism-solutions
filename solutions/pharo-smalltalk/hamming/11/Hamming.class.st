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
	self isSizeOfStrand1: strand1 equalToSizeOf: strand2.
	^ strand1 size - (strand1 howManyMatch: strand2)
	
]

{ #category : 'testing' }
Hamming >> isSizeOfStrand1: strand1 equalToSizeOf: strand2 [
	strand1 size = strand2 size ifTrue: [ ^ self ].
	strand1 ifEmpty: [ HammingError raiseEmptyStrandForSide: 'left' ].
	strand2 ifEmpty: [ HammingError raiseEmptyStrandForSide: 'right' ].
	HammingError raiseStrandsNotOfEqualLength
]
