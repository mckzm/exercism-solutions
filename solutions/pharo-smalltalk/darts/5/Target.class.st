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
