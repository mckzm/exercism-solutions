Class {
	#name : 'Circle',
	#superclass : 'Object',
	#instVars : [
		'radius',
		'score'
	],
	#category : 'Exercise@Darts',
	#package : 'Exercise@Darts'
}

{ #category : 'accessing' }
Circle >> containsPoint: aPoint [
	^ aPoint r <= radius
]

{ #category : 'accessing' }
Circle >> score [
	^ score 
]
