Extension { #name : #Integer }

{ #category : '*Exercise@CollatzConjecture' }
Integer >> collatzTransform [
	^ self even
		ifTrue: [ self // 2 ]
		ifFalse: [ 3 * self + 1 ]
]

{ #category : '*Exercise@CollatzConjecture' }
Integer >> doCollatzSteps: count [
	self = 1 ifTrue: [ ^ count ].
	^ self collatzTransform doCollatzSteps: count + 1.
]
