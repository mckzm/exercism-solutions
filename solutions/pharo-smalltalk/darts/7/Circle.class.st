"
I am the base class for circles on a Darts target. I maintain a radius and a score to allow the target to score a throw.
"
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
