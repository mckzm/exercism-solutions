Class {
	#name : 'Leap',
	#superclass : 'Object',
	#category : 'Exercise@Leap',
	#package : 'Exercise@Leap'
}

{ #category : 'testing' }
Leap >> leapYear: year [ 
	^ (year isDivisibleBy: 4) and: [
        (year isDivisibleBy: 100) not or: [
            year isDivisibleBy: 400 ] ].
]
