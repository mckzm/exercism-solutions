Extension { #name : #Integer }

{ #category : '*Exercise@Die' }
Integer >> d20 [
	^ self d: 20
]

{ #category : '*Exercise@Die' }
Integer >> d10 [
	^ self d: 10
]

{ #category : '*Exercise@Die' }
Integer >> d6 [
	^ self d: 6
]

{ #category : '*Exercise@Die' }
Integer >> d: numberOfFaces [
	^ DieHandle withDiceCollection:
		((1 to: self) collect: [ :_n | Die withFaces: numberOfFaces ]) asOrderedCollection
]
