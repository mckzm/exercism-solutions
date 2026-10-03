"
I can compute the number of steps needed for a given positive integer to reach 1 when transformed using the Collatz conjecture algorithm.
"
Class {
	#name : 'CollatzConjecture',
	#superclass : 'Object',
	#category : 'Exercise@CollatzConjecture',
	#package : 'Exercise@CollatzConjecture'
}

{ #category : 'private - computation' }
CollatzConjecture >> doStepsFrom: aPositiveInteger with: count [
	| next |
	aPositiveInteger = 1 ifTrue: [ ^ count ].
	next := aPositiveInteger even
		ifTrue: [ aPositiveInteger // 2 ]
		ifFalse: [ 3 * aPositiveInteger + 1 ].
	^ self doStepsFrom: next with: count + 1
]

{ #category : 'api' }
CollatzConjecture >> stepsFrom: anInteger [
	anInteger strictlyPositive
		ifFalse: [ self error: 'Only positive numbers are allowed' ].
	^ self doStepsFrom: anInteger with: 0.
]
