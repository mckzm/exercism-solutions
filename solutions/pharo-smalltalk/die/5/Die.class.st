"
I represent a die with >= 2 faces (6 by default).
"
Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'Exercise@Die',
	#package : 'Exercise@Die'
}

{ #category : 'instance creation' }
Die class >> new [
	^ self withFaces: 6
	
]

{ #category : 'instance creation' }
Die class >> withFaces: numberOfFaces [
	(numberOfFaces isInteger and: [ numberOfFaces >= 2 ])
		ifFalse: [ DomainError signal: (
			'A die must have at least 2 integer faces, I was passed {1}' format: { numberOfFaces }
			) ].
	^ super new initializeWithFaces: numberOfFaces
]

{ #category : 'accessing' }
Die >> faces [
	^ faces
]

{ #category : 'initialization' }
Die >> initialize [
	self initializeWithFaces: 6
]

{ #category : 'initialization' }
Die >> initializeWithFaces: numberOfFaces [
	faces := numberOfFaces
]

{ #category : 'random' }
Die >> roll [
	^ (1 to: faces) atRandom
]
