"
I can take a String and reverse it.

(I actually can take any SequenceableCollection instance and
 return a String representation of it with its elements in reverse
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
ReverseString >> reverseValue: aSequenceableCollection [
	^ String new: aSequenceableCollection size streamContents: [ :stream |
		aSequenceableCollection size to: 1 by: -1 do: [ :index | 
			stream nextPut: (aSequenceableCollection at: index) ] ]
]
