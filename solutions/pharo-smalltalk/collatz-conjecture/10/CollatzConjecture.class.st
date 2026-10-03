"
I can compute the number of steps needed for a given positive integer to reach 1 when transformed using the Collatz conjecture algorithm.
"
Class {
	#name : 'CollatzConjecture',
	#superclass : 'Object',
	#category : 'Exercise@CollatzConjecture',
	#package : 'Exercise@CollatzConjecture'
}

{ #category : 'api' }
CollatzConjecture >> stepsFrom: anInteger [
	anInteger strictlyPositive
		ifFalse: [ self error: 'Only positive numbers are allowed' ].
		^ anInteger doCollatzSteps: 0.
]
