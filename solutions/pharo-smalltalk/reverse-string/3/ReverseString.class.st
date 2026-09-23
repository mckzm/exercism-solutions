Class {
	#name : 'ReverseString',
	#superclass : 'Object',
	#category : 'Exercise@ReverseString',
	#package : 'Exercise@ReverseString'
}

{ #category : 'actions' }
ReverseString >> reverseValue: aString [
	| reversedChars |
	reversedChars := aString asArray inject: OrderedCollection new into: [ :acc :each |
		acc addFirst: each;
		yourself
		].
	^ '' join: reversedChars
]
