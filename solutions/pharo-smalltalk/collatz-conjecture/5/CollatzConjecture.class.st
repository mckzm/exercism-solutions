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
CollatzConjecture >> doStepsFrom: aPositiveInteger withCount: count [
	aPositiveInteger = 1 ifTrue: [ ^ count ].
	^ aPositiveInteger even
		ifTrue: [ self doStepsFrom: aPositiveInteger // 2 withCount: count + 1 ]
		ifFalse: [ self doStepsFrom: 3 * aPositiveInteger + 1 withCount: count + 1 ]
]

{ #category : 'api' }
CollatzConjecture >> stepsFrom: anInteger [
	anInteger strictlyPositive
		ifFalse: [ self error: 'Only positive numbers are allowed' ].
	^ self doStepsFrom: anInteger withCount: 0.
]
