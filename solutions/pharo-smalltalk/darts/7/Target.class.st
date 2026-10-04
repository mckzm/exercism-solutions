"
I am a target for the game of Darts. I maintain a collection of concentric circles to evaluate a throw's scores based on which circle it falls within.
"
Class {
	#name : 'Target',
	#superclass : 'Object',
	#instVars : [
		'circles'
	],
	#category : 'Exercise@Darts',
	#package : 'Exercise@Darts'
}

{ #category : 'accessing' }
Target >> circles [
	^ circles
]

{ #category : 'initialization' }
Target >> initialize [
	circles := {
		Inner new.
		Middle new.
		Outer new
	}
]

{ #category : 'scoring' }
Target >> scoreforPoint: aPoint [
	^ (circles detect: [ :each | each containsPoint: aPoint ] ifNone: [ ^ 0 ]) score
]
