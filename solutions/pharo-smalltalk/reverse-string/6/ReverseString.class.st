"
I can take a String and reverse it.

(I actually can take any SequenceableCollection instance and
 return a String instance of it with its elements in reverse
 order.)

Examples:
  ReverseString new reverseValue: 'Hello, World!' ""-> '!dlroW ,olleH'""
  ReverseString new reverseValue: #(1 2 3) ""-> '321'""
  ReverseString new reverseValue: #[1 42 255] ""-> '255421'""
"
Class {
	#name : 'ReverseString',
	#superclass : 'Object',
	#category : 'Exercise@ReverseString',
	#package : 'Exercise@ReverseString'
}

{ #category : 'actions' }
ReverseString >> reverseValue: aString [
	| reversedChars |
	reversedChars := aString asArray inject: OrderedCollection new into: [ :acc :each |
		acc addFirst: each;
		yourself
		].
	^ '' join: reversedChars
]
