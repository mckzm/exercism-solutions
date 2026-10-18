Class {
	#name : 'Raindrops',
	#superclass : 'Object',
	#category : 'Exercise@Raindrops',
	#package : 'Exercise@Raindrops'
}

{ #category : 'as yet unclassified' }
Raindrops >> convertNumber: aNumber [
	| s |
	s := ''.
	aNumber % 3 = 0 ifTrue: [ s := 'Pling' ].
	aNumber % 5 = 0 ifTrue: [ s := s, 'Plang' ].
	aNumber % 7 = 0 ifTrue: [ s := s, 'Plong' ].
	s ifEmpty: [ s := aNumber asString ].
	^ s
]
