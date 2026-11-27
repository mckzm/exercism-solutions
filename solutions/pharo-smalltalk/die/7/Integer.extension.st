Extension { #name : #Integer }

{ #category : '*Exercise@Die' }
Integer >> d20 [
	|handle|
	handle := DieHandle new.
	self timesRepeat: [ handle addDie: (Die withFaces: 20) ].
	^ handle
]

{ #category : '*Exercise@Die' }
Integer >> d6 [
	|handle|
	handle := DieHandle new.
	self timesRepeat: [ handle addDie: Die new ].
	^ handle
]

{ #category : '*Exercise@Die' }
Integer >> d10 [
	|handle|
	handle := DieHandle new.
	self timesRepeat: [ handle addDie: (Die withFaces: 10) ].
	^ handle
]
