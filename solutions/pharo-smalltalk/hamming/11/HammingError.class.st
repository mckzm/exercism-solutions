"
I am HammingError, an exception indicating that computing the Hamming distance between two strings was attempted on strings of unequal length.
"
Class {
	#name : 'HammingError',
	#superclass : 'Error',
	#category : 'Exercise@Hamming',
	#package : 'Exercise@Hamming'
}

{ #category : 'private - exceptions' }
HammingError class >> raiseEmptyStrandForSide: side [
	^ self signal: ('{1} strand must not be empty' format: { side }).
]

{ #category : 'exceptions' }
HammingError class >> raiseLeftEmptyStrand [
	^ self raiseEmptyStrandForSide: 'left'
]

{ #category : 'exceptions' }
HammingError class >> raiseRightEmptyStrand [
	^ self raiseEmptyStrandForSide: 'right'
]

{ #category : 'exceptions' }
HammingError class >> raiseStrandsNotOfEqualLength [
	^ self signal: 'left and right strands must be of equal length'
]
