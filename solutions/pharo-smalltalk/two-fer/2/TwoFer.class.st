Class {
	#name : 'TwoFer',
	#superclass : 'Object',
	#category : 'Exercise@TwoFer',
	#package : 'Exercise@TwoFer'
}

{ #category : 'as yet unclassified' }
TwoFer >> who [
	^ self who: 'you'
]

{ #category : 'as yet unclassified' }
TwoFer >> who: aString [
	^ 'One for {1}, one for me.' format: { aString }
]
