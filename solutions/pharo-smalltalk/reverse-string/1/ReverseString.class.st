Class {
	#name : 'ReverseString',
	#superclass : 'Object',
	#category : 'Exercise@ReverseString',
	#package : 'Exercise@ReverseString'
}

{ #category : 'actions' }
ReverseString >> reverseValue: aString [
   | rev |
    rev := ''.
   "Slow - triggers `String concatenation instead of streams` warning"
	aString do: [ :each |  rev := each asString , rev ].
	^ rev
]
