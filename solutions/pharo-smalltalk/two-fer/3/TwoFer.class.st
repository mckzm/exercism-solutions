"
I return a ""two-fer"" string that interpolates the name I was supplied with, or a default value if I wasn't supplied with a name.
"
Class {
	#name : 'TwoFer',
	#superclass : 'Object',
	#category : 'Exercise@TwoFer',
	#package : 'Exercise@TwoFer'
}

{ #category : 'operations' }
TwoFer >> who [
	^ self who: 'you'
]

{ #category : 'operations' }
TwoFer >> who: aString [
	^ 'One for {1}, one for me.' format: { aString }
]
