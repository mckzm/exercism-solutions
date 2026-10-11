# Grains

Welcome to Grains on Exercism's Pharo Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

There once was a wise servant who saved the life of a prince.
The king promised to pay whatever the servant could dream up.
Knowing that the king loved chess, the servant told the king he would like to have grains of wheat.
One grain on the first square of a chessboard, with the number of grains doubling on each successive square.

## Instructions

Calculate the number of grains of wheat on a chessboard.

A chessboard has 64 squares.
Square 1 has one grain, square 2 has two grains, square 3 has four grains, and so on, doubling each time.

Write code that calculates:

- the number of grains on a given square
- the total number of grains on the chessboard

## Note

These kinds of problems (where an answer is dependent on a previous) one are often called recursion.
There are different ways to code for recursion, it might be worth reasearching if you are not familiar with this.
Pharo is well optimised for recursion, and it is a commonly used pattern.

Note: in the original problem specification, the grainsCalculator is called via #square, however we have renamed this method #atSquare: which is a more Smalltalk like name, that better describes that you are asking for an answer "at a square".

## Source

### Created by

- @macta

### Contributed to by

- @bencoman

### Based on

The CodeRanch Cattle Drive, Assignment 6 - https://web.archive.org/web/20240908084142/https://coderanch.com/wiki/718824/Grains