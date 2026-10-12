Class {
	#name : 'Hamming',
	#superclass : 'Object',
	#category : 'Exercise@Hamming',
	#package : 'Exercise@Hamming'
}

{ #category : 'computing' }
Hamming >> distanceStrand1: strand1 strand2: strand2 [
   (strand1 isEmpty and: [ strand2 isEmpty ]) ifTrue: [ ^ 0 ].
	strand1 isEmpty ifTrue: [ ^ self error: 'left strand must not be empty' ].
	strand2 isEmpty ifTrue: [ ^ self error: 'right strand must not be empty' ].
	strand1 size ~= strand2 size ifTrue: [ ^ self error: 'left and right strands must be of equal length' ].
	^ (strand1 asArray with: strand2 collect: [ :c1 :c2 | c1 = c2 ifTrue: [ 0 ] ifFalse: [ 1 ] ]) sum.
	
]
