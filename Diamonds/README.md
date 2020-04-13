# Diamonds

The goal is simple, provided a letter you display a "diamond" made of each letter between 'A' and the given letter.

## Example for letter 'G'

      A
     B B
    C   C
   D     D
  E       E
 F         F
G           G
 F         F
  E       E
   D     D
    C   C
     B B
      A
      

## How I did it

The approach I took was TDD but recycling the same test instead of writing a bunch of tests, that is because each time I would modify the system under test (which is a single function here) to pass a new test, it would break the tests that were passing before.

Nonetheless I documented the steps I took inside the code with comments and an assertion showing what I wanted to prove

## Source

http://codingdojo.org/kata/Diamond/
