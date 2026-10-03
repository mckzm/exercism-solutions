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
		ifFalse: [ Error signal: 'Only positive numbers are allowed' ].
	^ self doStepsFrom: anInteger with: 0.
]
